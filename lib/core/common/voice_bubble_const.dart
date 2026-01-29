import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math' as math;

class VoiceNoteBubble extends StatefulWidget {
  final String url; // mp3 URL
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
  final AudioPlayer _player = AudioPlayer();
  bool _loading = false;

  // Whether we've preloaded the URL metadata (duration) to show total duration
  bool _preloadedDuration = false;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();

    _player.durationStream.listen((d) {
      if (d != null) setState(() => _duration = d);
    });

    _player.positionStream.listen((p) {
      setState(() => _position = p);
    });

    _player.playerStateStream.listen((state) {
      // reset position when completed (like WhatsApp)
      if (state.processingState == ProcessingState.completed) {
        _player.seek(Duration.zero);
        _player.pause();
      }
    });

    // Try to preload metadata (duration) so we can display total duration
    // even before the user presses play. This won't start playback.
    _preloadDuration();
  }

  Future<void> _preloadDuration() async {
    if (_preloadedDuration) return;
    if (widget.url.isEmpty) return;

    try {
      setState(() => _loading = true);
      // setUrl will load metadata (duration) but not start playback.
      await _player.setUrl(widget.url);
      _preloadedDuration = true;
    } catch (e) {
      debugPrint('Preload audio metadata failed: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _togglePlay() async {
    try {
      if (_player.playing) {
        await _player.pause();
        return;
      }

      // If not already prepared/preloaded, ensure we set the URL now.
      if (_player.processingState == ProcessingState.idle) {
        setState(() => _loading = true);
        try {
          await _player.setUrl(widget.url); // mp3 works here
          _preloadedDuration = true;
        } catch (e) {
          debugPrint('Audio setUrl failed on play: $e');
        } finally {
          if (mounted) setState(() => _loading = false);
        }
      }

      await _player.play();
    } catch (e) {
      setState(() => _loading = false);
      debugPrint("Audio/mpeg play error: $e");
    }
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

    final totalMs = _duration.inMilliseconds == 0 ? 1 : _duration.inMilliseconds;
    final progress = (_position.inMilliseconds / totalMs).clamp(0.0, 1.0);

    // Make bubble width responsive: use 75% of screen width, capped to 360
    final screenWidth = MediaQuery.of(context).size.width;
    final maxBubbleWidth = math.min(screenWidth * 0.75, 360.0);

    // Wrap the existing container in a ConstrainedBox so it adapts to screen size
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxBubbleWidth),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
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
                    _player.playing ? Icons.pause : Icons.play_arrow,
                    color: fg,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Flexible progress bar that fills available space instead of fixed 160
            Expanded(
              child: SizedBox(
                height: 24,
                child: Center(
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 4,
                    backgroundColor: widget.isMe ? Colors.white24 : Colors.black12,
                    valueColor: AlwaysStoppedAnimation<Color>(fg),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10),

            Text(
              // While playing show current position, otherwise show total duration
              // If duration is not known yet, show a placeholder "--:--".
              _player.playing
                  ? _fmt(_position)
                  : (_duration.inMilliseconds > 0 ? _fmt(_duration) : ""),
              style: TextStyle(color: fg, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
