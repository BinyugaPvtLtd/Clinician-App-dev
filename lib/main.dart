import 'package:clinician_app/controller/calling_controller.dart';
import 'package:clinician_app/controller/notification_controller.dart';
import 'package:clinician_app/controller/splash_controller.dart';
import 'package:clinician_app/core/constant/constant_import.dart';
import 'package:clinician_app/pages/auth/splash_screen.dart';
import 'package:clinician_app/pages/video_calling/call_ring.dart';
import 'package:clinician_app/pages/video_calling/calling_notification.dart';
import 'package:clinician_app/pages/video_calling/message_notification.dart';
import 'package:clinician_app/services/chat_notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:media_kit/media_kit.dart';
import 'package:permission_handler/permission_handler.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await GetStorage.init();

  // if (Firebase.apps.isEmpty) {
  //WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  } on FirebaseException catch (e) {
    if (e.code != 'duplicate-app') rethrow;
  }

  // Request notification permission (Android 13+ requires this at runtime)
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  // ✅ Request call permissions (mic + camera) so accepting a call on
  // Android 14+ doesn't crash the FGS with SecurityException.
  await requestCallPermissions();

  // Create the chat notification channel on the device
  await ChatNotificationService.init();

  setupForegroundCallListener();
  setupBackgroundCallListener();
  setupCallkitListener();      // handles Accept/Decline events (foreground + background)
  setupKilledStateAcceptHandler(); // handles Accept when app was completely killed
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  MediaKit.ensureInitialized();
  runApp(const ClinicalApp());
}

// ✅ NEW: Request microphone + camera + notification permissions.
// Must already be GRANTED before the user taps Accept on an incoming call,
// otherwise the callkit foreground service (type microphone|camera) throws
// SecurityException on Android 14+.
Future<void> requestCallPermissions() async {
  final statuses = await [
    Permission.microphone,
    Permission.camera,
    Permission.notification,
  ].request();

  if (statuses[Permission.microphone] == PermissionStatus.permanentlyDenied ||
      statuses[Permission.camera] == PermissionStatus.permanentlyDenied) {
    debugPrint('⚠️ Mic/Camera permanently denied — calls may fail. '
        'User must enable them in app settings.');
    // Optionally: await openAppSettings();
  }
}

bool _manuallyRejected = false;

/// If you still need navigatorKey for overlay toast usage, keep it.
/// But dialogs/navigation will be handled by GetX.
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final callController = Get.put(CallingController());

// ── CallKit event listener ────────────────────────────────────────────────
// Handles Accept / Decline button taps from flutter_callkit_incoming UI.
// Works for both background (app resuming) and killed (app re-launching) states.
void setupCallkitListener() {
  FlutterCallkitIncoming.onEvent.listen((CallEvent? event) {
    if (event == null) return;

    switch (event) {
      case CallEventActionCallAccept():
        final callId  = event.callKitParams.extra?['callId']?.toString()  ?? event.callKitParams.id;
        final isVideo = event.callKitParams.extra?['isVideo']?.toString() ?? 'false';
        AndroidCallRingtone.stop();
        _navigateToCallWhenReady(callId, isVideo);
      case CallEventActionCallDecline():
        final callId = event.callKitParams.extra?['callId']?.toString() ?? event.callKitParams.id;
        AndroidCallRingtone.stop();
        callController.handleCallDecline({'callId': callId});
      case CallEventActionCallEnded():
        AndroidCallRingtone.stop();
      case CallEventActionCallTimeout():
        AndroidCallRingtone.stop();
      default:
        break;
    }
  });
}

// ── Killed-state Accept handler ───────────────────────────────────────────
// When the app is killed and the user taps Accept in the callkit notification:
//   1. CallkitIncomingBroadcastReceiver schedules acceptCallHandleCallback (750 ms delay)
//   2. TransparentActivity launches MainActivity (cold start — Flutter takes ~1–2 s)
//   3. We register acceptCallHandle() here so when the 750 ms fires and the method
//      channel is ready, we immediately navigate to the call.
//   4. activeCalls() is the fallback for very slow devices where 750 ms is not enough.
void setupKilledStateAcceptHandler() {
  // Primary: method-channel callback (fired ~750 ms after Accept tap by native code)
  FlutterCallkitIncoming.acceptCallHandle((Map<dynamic, dynamic> data) {
    final callId  = data['callId']?.toString()  ?? '';
    final isVideo = data['isVideo']?.toString() ?? 'false';
    if (callId.isEmpty) return;
    AndroidCallRingtone.stop();
    _navigateToCallWhenReady(callId, isVideo);
  });

  // Fallback: if the method call arrived before Flutter was ready, the call is
  // still persisted as isAccepted=true in SharedPreferences. Check on startup.
  Future.delayed(const Duration(milliseconds: 1200), () async {
    try {
      final calls = await FlutterCallkitIncoming.activeCalls();
      if (calls == null) return;
      final list = calls is List ? calls : (calls as Map).values.toList();
      for (final c in list) {
        final map = c is Map ? c : <dynamic, dynamic>{};
        final extra = map['extra'] as Map? ?? {};
        final callId  = extra['callId']?.toString()  ?? map['id']?.toString() ?? '';
        final isVideo = extra['isVideo']?.toString() ?? 'false';
        // Only handle calls that were accepted while app was killed (not already navigated)
        if (callId.isNotEmpty && Get.context != null) {
          AndroidCallRingtone.stop();
          callController.handleCallAccepted({'callId': callId}, navigatorKey, isVideo);
          break;
        }
      }
    } catch (_) {}
  });
}

// ── Navigate to call (background: immediately; killed: poll until ready) ──
void _navigateToCallWhenReady(String callId, String isVideo) {
  // Tell SplashController not to navigate to HomeScreen — a call accept is
  // in progress and will handle its own navigation once the API responds.
  if (Get.isRegistered<SplashController>()) {
    Get.find<SplashController>().skipNavigation();
  }

  if (Get.context != null) {
    callController.handleCallAccepted({'callId': callId}, navigatorKey, isVideo);
    return;
  }
  int attempts = 0;
  void poll() {
    attempts++;
    if (Get.context != null) {
      callController.handleCallAccepted({'callId': callId}, navigatorKey, isVideo);
    } else if (attempts < 20) {
      Future.delayed(const Duration(milliseconds: 500), poll);
    }
  }
  WidgetsBinding.instance.addPostFrameCallback((_) => poll());
}

// ✅ Helper: update bell dot + refresh notification list (safe if controller not created yet)
void _notifyNewNotification({bool refreshList = true}) {
  if (Get.isRegistered<NotificationController>()) {
    final notificationController = Get.find<NotificationController>();
    notificationController.hasNewNotification.value = true;
    if (refreshList) {
      notificationController.fetchNotificationListData();
    }
  }
}

void setupForegroundCallListener() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    final data = message.data;
    // print("📲 Received foreground notification: ${message.data}");
    debugPrint("Message: $data");

    // =========================
    // HANDLE CALL INCOMING
    // =========================
    if (data['type'] == 'CALL_INCOMING') {
      final callerName = (data['callerName'] ?? 'Unknown').toString();
      final callId = (data['callId'] ?? '').toString();
      final userProfile = (data['contactImage'] ?? '').toString();
      final isVideo = (data['isVideo'] ?? 'false').toString();

      // ✅ Show bell dot immediately (call appears in notification list)
      _notifyNewNotification(refreshList: false);

      // 🔔 START RINGTONE (Android)
      AndroidCallRingtone.start();

      // ✅ GetX dialog (no BuildContext needed)
      await Get.dialog(
        AndroidIncomingCallOverlay(
          userImage: userProfile,
          callerName: callerName,

          onAccept: () {
            // 🔕 STOP RINGTONE
            AndroidCallRingtone.stop();

            // Prevent SplashController from overriding call navigation
            if (Get.isRegistered<SplashController>()) {
              Get.find<SplashController>().skipNavigation();
            }

            // ✅ close dialog safely
            if (Get.isDialogOpen == true) {
              Get.back();
            }

            // ✅ do async work after closing
            () async {
              await callController.handleCallAccepted(
                {"callId": callId},
                navigatorKey,
                isVideo,
              );
            }();
          },

          onReject: () {
            _manuallyRejected = true;

            // 🔕 STOP RINGTONE
            AndroidCallRingtone.stop();

            // ✅ close dialog safely
            if (Get.isDialogOpen == true) {
              Get.back();
            }

            () async {
              await callController.handleCallDecline({"callId": callId});
            }();
          },
        ),
        barrierDismissible: false,
      ).whenComplete(() {
        // 🔕 SAFETY
        AndroidCallRingtone.stop();
      });
    }

    // =========================
    // HANDLE CALL CUT / MISSED
    // =========================
    else if (data['type'] == 'CALL_MISSED' ||
        data['type'] == 'CALL_ENDED' ||
        data['type'] == 'CALL_DECLINED') {
      // 🔕 STOP RINGTONE
      AndroidCallRingtone.stop();

      // Dismiss CallKit UI if it is still visible (caller hung up / timed out).
      FlutterCallkitIncoming.endAllCalls();

      // ✅ Missed/ended call becomes a notification → show dot + refresh list
      _notifyNewNotification();

      // Only dismiss dialog — never pop VideoCallAgoraScreen
      if (!_manuallyRejected) {
        if (Get.isDialogOpen == true) {
          Get.back();
        }
      }

      _manuallyRejected = false; // reset
      debugPrint("Call ended UI closed.");
    }

    // =========================
    // OTHER NOTIFICATION TYPE
    // =========================
    else {
      // print("📲 Received foreground notification: ${message.data}");
      final title = message.notification?.title ?? 'New message';
      final body = message.notification?.body ?? 'You have a new notification';

      // ✅ Show bell dot immediately + refresh notification list
      _notifyNewNotification();

      showTeamsMessageToastTop(
        title: title,
        message: body,
        onOpen: () {
          // Example:
          // Get.to(() => const ChatsScreen());
        },
        navigatorKey: navigatorKey,
      );
    }
  });
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final data = message.data;
  final type = (data['type'] ?? '').toString();

  // Call events are handled entirely by MyFirebaseMessagingService (native Android).
  // That service sends the callkit broadcast directly to CallkitIncomingBroadcastReceiver
  // without needing the Flutter engine, so we skip call types here to avoid conflicts.
  if (type == 'CALL_INCOMING' ||
      type == 'CALL_MISSED'   ||
      type == 'CALL_ENDED'    ||
      type == 'CALL_DECLINED') {
    return;
  }

  // Chat / all other notifications — show heads-up notification
  final title = message.notification?.title ??
      (data['title'] as String?)?.trim() ?? '';
  final body = message.notification?.body ??
      (data['body'] as String?)?.trim() ?? '';

  if (title.isEmpty && body.isEmpty) return;

  await ChatNotificationService.show(
    id: message.hashCode,
    title: title.isEmpty ? 'New Message' : title,
    body: body,
    senderImageUrl: (data['senderImage'] ?? data['imageUrl'] ?? data['contactImage'] ?? '').toString(),
    payloadData: data,
  );
}

void setupBackgroundCallListener() {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    debugPrint("📲 Opened from notification (background): ${message.data}");

    final data = message.data;

    // ✅ App opened from a notification → refresh list so dot/list is current
    if (Get.isRegistered<NotificationController>()) {
      Get.find<NotificationController>().fetchNotificationListData();
    }

    // Only handle call notifications
    if (data['type'] != 'CALL_INCOMING') return;

    final String callerName = (data['callerName'] ?? 'Unknown').toString();
    final String callId = (data['callId'] ?? '').toString();
    final String isVideo = (data['isVideo'] ?? 'false').toString();

    // ✅ GetX dialog for background open
    Get.dialog(
      AndroidIncomingCallOverlay(
        callerName: callerName,
        onAccept: () async {
          if (Get.isDialogOpen == true) Get.back();
          await callController.handleCallAccepted({"callId": callId}, navigatorKey, isVideo);
        },
        onReject: () async {
          _manuallyRejected = true;
          if (Get.isDialogOpen == true) Get.back();
          await callController.handleCallRejected({"callId": callId});
        },
      ),
      barrierDismissible: false,
    );
  });
}

void showTeamsMessageToastTop({
  required GlobalKey<NavigatorState> navigatorKey,
  required String title,
  required String message,
  VoidCallback? onOpen,
  Duration duration = const Duration(seconds: 5),
}) {
  final overlayState = navigatorKey.currentState?.overlay;
  if (overlayState == null) return;

  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) {
      return TopToastEntry(
        title: title,
        message: message,
        duration: duration,
        onOpen: () {
          if (entry.mounted) entry.remove();
          onOpen?.call();
        },
        onDismiss: () {
          if (entry.mounted) entry.remove();
        },
      );
    },
  );

  overlayState.insert(entry);
}

class ClinicalApp extends StatelessWidget {
  const ClinicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      enableScaleText: () => true,
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Clinician App',
          navigatorKey: navigatorKey,
          defaultTransition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 300),
          popGesture: true,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryAppColor,
            ),
            fontFamily: AppTextStyle.fontFamily,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}