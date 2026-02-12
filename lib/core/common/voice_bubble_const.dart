import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';

class VoiceNoteBubble extends StatefulWidget {
  final String url; // MPEG URL
  final bool isMe;

  const VoiceNoteBubble({
    super.key,
    required this.url,
    required this.isMe,
  });

  @override
  State<VoiceNoteBubble> createState() => _VoiceNoteBubbleState();
}

class _VoiceNoteBubbleState extends State<VoiceNoteBubble> {
  late final Player _player;

  bool _loading = false;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;

  StreamSubscription? _posSub;
  StreamSubscription? _durSub;
  StreamSubscription? _playSub;

  bool _opened = false;

  @override
  void initState() {
    super.initState();

    _player = Player();

    // Position
    _posSub = _player.stream.position.listen((p) {
      if (!mounted) return;
      setState(() => _position = p);
    });

    // Duration
    _durSub = _player.stream.duration.listen((d) {
      if (!mounted) return;
      if (d != null) setState(() => _duration = d);
    });

    // Playing
    _playSub = _player.stream.playing.listen((v) {
      if (!mounted) return;
      setState(() => _isPlaying = v);
    });

    // Optional: preload metadata (best-effort)
    _openIfNeeded(preload: true);
  }

  Future<void> _openIfNeeded({bool preload = false}) async {
    if (_opened) return;
    if (widget.url.isEmpty) return;

    try {
      if (mounted) setState(() => _loading = true);

      // Open media. Keep play=false for preload.
      await _player.open(
        Media(widget.url),
        play: !preload ? false : false,
      );

      _opened = true;
    } catch (e) {
      debugPrint("media_kit open error: $e");
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _togglePlay() async {
    try {
      if (mounted) setState(() => _loading = true);

      await _openIfNeeded(preload: false);

      if (_isPlaying) {
        await _player.pause();
      } else {
        await _player.play();
      }
    } catch (e) {
      debugPrint("media_kit play error: $e");
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _posSub?.cancel();
    _durSub?.cancel();
    _playSub?.cancel();
    _player.dispose();
    super.dispose();
  }

  String _fmt(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  @override
  Widget build(BuildContext context) {
    final bg = widget.isMe ? Colors.green : Colors.grey.shade200;
    final fg = widget.isMe ? Colors.white : Colors.black87;

    final totalMs = _duration.inMilliseconds <= 0 ? 1 : _duration.inMilliseconds;
    final progress = (_position.inMilliseconds / totalMs).clamp(0.0, 1.0);

    final screenWidth = MediaQuery.of(context).size.width;
    final maxBubbleWidth = math.min(screenWidth * 0.75, 360.0);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxBubbleWidth),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: _togglePlay,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.isMe ? Colors.white24 : Colors.black12,
                ),
                child: Center(
                  child: _loading
                      ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(fg),
                    ),
                  )
                      : Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: fg,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 4,
                backgroundColor: widget.isMe ? Colors.white24 : Colors.black12,
                valueColor: AlwaysStoppedAnimation<Color>(fg),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              _isPlaying
                  ? _fmt(_position)
                  : (_duration > Duration.zero ? _fmt(_duration) : ""),
              style: TextStyle(color: fg, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
