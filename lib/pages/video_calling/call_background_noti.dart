import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// ─── No GetX / CallingController imports here ───────────────────────────────
// This file is loaded by the FCM background isolate (firebaseMessagingBackgroundHandler).
// That isolate has no full Flutter engine, so Flutter plugins like agora_rtc_engine
// will crash on load.  Keep this file lean: only dart:core + flutter_local_notifications.
// ─────────────────────────────────────────────────────────────────────────────

class CallNotificationService {
  static const String channelId   = 'incoming_call_channel';
  static const int    notifId     = 9001;
  static const String actionAccept = 'CALL_ACCEPT';
  static const String actionReject = 'CALL_REJECT';

  // ── Called once from main() in the main isolate ──────────────────────────
  // onResponse handles Accept / Decline button taps; defined in main.dart
  // so it can safely access CallingController and GetX.
  static Future<void> init({
    required void Function(NotificationResponse) onResponse,
  }) async {
    final fln = FlutterLocalNotificationsPlugin();

    await fln.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
      onDidReceiveNotificationResponse: onResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    await fln
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(const AndroidNotificationChannel(
          channelId,
          'Incoming Calls',
          description: 'Incoming call notifications',
          importance: Importance.max,
        ));
  }

  // ── Called from firebaseMessagingBackgroundHandler (background isolate) ───
  // Keep every import inside this method's runtime path lean.
  static Future<void> showIncomingCall({
    required String callId,
    required String callerName,
    String? profileUrl,
    String isVideo = 'false',
  }) async {
    final fln = FlutterLocalNotificationsPlugin();

    // Must call initialize() before show() — background isolate never ran init().
    // Do NOT pass onDidReceiveBackgroundNotificationResponse here: registering
    // a background callback from inside the background isolate itself can crash
    // the initialization.  Both our actions have showsUserInterface:true so
    // they always bring the app to the foreground — this callback is never used.
    await fln.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
    );

    await fln
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(const AndroidNotificationChannel(
          channelId,
          'Incoming Calls',
          description: 'Incoming call notifications',
          importance: Importance.max,
        ));

    await fln.show(
      notifId,
      'Incoming Call',
      callerName,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          'Incoming Calls',
          channelDescription: 'Incoming call notifications',
          importance: Importance.max,
          priority: Priority.high,
          category: AndroidNotificationCategory.call,
          fullScreenIntent: true,
          ongoing: true,
          autoCancel: false,
          timeoutAfter: 30000,
          actions: const <AndroidNotificationAction>[
            AndroidNotificationAction(
              actionReject,
              'Decline',
              icon: DrawableResourceAndroidBitmap('ic_call_decline'),
              showsUserInterface: true,
              cancelNotification: true,
            ),
            AndroidNotificationAction(
              actionAccept,
              'Accept',
              icon: DrawableResourceAndroidBitmap('ic_call_accept'),
              showsUserInterface: true,
              cancelNotification: true,
            ),
          ],
        ),
      ),
      payload: jsonEncode({
        'type': 'CALL_INCOMING',
        'callId': callId,
        'callerName': callerName,
        'isVideo': isVideo,
      }),
    );
  }

  static Future<void> dismiss() async {
    final fln = FlutterLocalNotificationsPlugin();
    await fln.cancel(notifId);
  }
}

/// Top-level — required by flutter_local_notifications for background isolate.
/// Our actions all have showsUserInterface:true so they always bring the app to
/// the foreground and fire onDidReceiveNotificationResponse instead of this.
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) {}
