import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ChatNotificationService {
  static const String channelId   = 'chat_messages_channel';
  static const String channelName = 'Chat Messages';
  static const String channelDesc = 'Incoming chat message notifications';

  /// Call once in main() — creates the channel and wires up the tap callback.
  static Future<void> init({
    void Function(Map<String, dynamic> data)? onNotificationTap,
  }) async {
    final fln = FlutterLocalNotificationsPlugin();

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    await fln.initialize(
      const InitializationSettings(android: androidInit),
      onDidReceiveNotificationResponse: (response) {
        if (onNotificationTap == null) return;
        final payload = response.payload;
        if (payload == null || payload.isEmpty) return;
        try {
          onNotificationTap(jsonDecode(payload) as Map<String, dynamic>);
        } catch (_) {}
      },
      onDidReceiveBackgroundNotificationResponse: _onBackgroundTap,
    );

    await _ensureChannel(fln);
  }

  /// Show a WhatsApp-style heads-up notification with optional sender image.
  /// Safe to call from both the main isolate and the background isolate.
  static Future<void> show({
    required int id,
    required String title,          // sender name
    required String body,           // message text
    String? senderImageUrl,         // sender profile picture URL
    Map<String, dynamic>? payloadData,
  }) async {
    final fln = FlutterLocalNotificationsPlugin();

    // Background isolate must re-init independently.
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    await fln.initialize(const InitializationSettings(android: androidInit));
    await _ensureChannel(fln);

    // Download sender image bytes (works in background isolate — uses dart:io only)
    final Uint8List? imageBytes = await _downloadImage(senderImageUrl);

    // Person = the message sender shown like WhatsApp
    final sender = Person(
      name: title,
      important: true,
      icon: imageBytes != null ? ByteArrayAndroidIcon(imageBytes) : null,
    );

    // MessagingStyleInformation gives the WhatsApp bubble layout
    final messagingStyle = MessagingStyleInformation(
      sender,
      groupConversation: false,
      messages: [
        Message(body, DateTime.now(), sender),
      ],
    );

    final androidDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDesc,
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.message,
      styleInformation: messagingStyle,
      // Large icon (circle on the right side of the notification)
      largeIcon: imageBytes != null ? ByteArrayAndroidBitmap(imageBytes) : null,
      enableVibration: true,
      playSound: true,
      fullScreenIntent: false,
      autoCancel: true,
    );

    await fln.show(
      id,
      title,
      body,
      NotificationDetails(android: androidDetails),
      payload: payloadData != null ? jsonEncode(payloadData) : null,
    );
  }

  static Future<void> _ensureChannel(FlutterLocalNotificationsPlugin fln) async {
    const channel = AndroidNotificationChannel(
      channelId,
      channelName,
      description: channelDesc,
      importance: Importance.max,
      enableVibration: true,
      playSound: true,
    );
    final androidPlugin =
        fln.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.createNotificationChannel(channel);
  }

  /// Downloads an image from a URL and returns raw bytes.
  /// Uses only dart:io so it works inside the background isolate.
  static Future<Uint8List?> _downloadImage(String? url) async {
    if (url == null || url.trim().isEmpty) return null;
    try {
      final client = HttpClient();
      final request = await client.getUrl(Uri.parse(url));
      final response = await request.close();
      if (response.statusCode != 200) {
        client.close();
        return null;
      }
      final chunks = <int>[];
      await for (final chunk in response) {
        chunks.addAll(chunk);
      }
      client.close();
      return Uint8List.fromList(chunks);
    } catch (_) {
      return null;
    }
  }
}

@pragma('vm:entry-point')
void _onBackgroundTap(NotificationResponse response) {
  // Navigation on tap is handled in main() via onDidReceiveNotificationResponse.
}
