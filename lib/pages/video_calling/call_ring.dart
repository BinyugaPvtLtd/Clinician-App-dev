import 'dart:io';
import 'package:audioplayers/audioplayers.dart';

class AndroidCallRingtone {
  static final AudioPlayer _player = AudioPlayer();
  static bool _isPlaying = false;

  static Future<void> start() async {
    if (!Platform.isAndroid || _isPlaying) return;
    _isPlaying = true;

    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.play(
      AssetSource('audio/incommingCall.mp3'),
      volume: 1.0,
    );
  }

  static Future<void> stop() async {
    if (!Platform.isAndroid || !_isPlaying) return;
    _isPlaying = false;

    await _player.stop();
  }
}

