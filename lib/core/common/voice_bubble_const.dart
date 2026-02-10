import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

class VoiceNoteBubble extends StatefulWidget {
  final String url; // your S3 url ending .mpeg
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
  String? _error;
  double? _downloadProgress;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  String? _localPath; // cached audio file

  @override
  void initState() {
    super.initState();

    _player.durationStream.listen((d) {
      if (!mounted) return;
      setState(() => _duration = d ?? Duration.zero);
    });

    _player.positionStream.listen((p) {
      if (!mounted) return;
      setState(() => _position = p);
    });

    _player.playerStateStream.listen((state) {
      if (!mounted) return;
      if (state.processingState == ProcessingState.completed) {
        _player.seek(Duration.zero);
        _player.pause();
      }
    });

    // ✅ prepare once (download + setFilePath)
    _prepareLocal();
  }

  @override
  void didUpdateWidget(covariant VoiceNoteBubble oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _player.stop();
      _localPath = null;
      _duration = Duration.zero;
      _position = Duration.zero;
      _prepareLocal();
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<File> _cacheFileForUrl(String url) async {
    final dir = await getTemporaryDirectory();
    // stable filename from url
    final bytes = utf8.encode(url);
    final key = base64Url.encode(bytes).replaceAll('=', '');
    return File('${dir.path}/voice_$key.mpeg'); // keep .mpeg extension
  }

  Future<void> _downloadToFile(String url, File outFile) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(seconds: 20);

    try {
      final uri = Uri.parse(url);
      final req = await client.getUrl(uri);
      final res = await req.close();

      if (res.statusCode < 200 || res.statusCode >= 300) {
        throw Exception('Download failed: HTTP ${res.statusCode}');
      }

      final total = res.contentLength; // -1 if unknown
      int received = 0;

      final sink = outFile.openWrite(mode: FileMode.writeOnly);
      await for (final chunk in res) {
        received += chunk.length;
        sink.add(chunk);

        if (total > 0 && mounted) {
          setState(() => _downloadProgress = received / total);
        }
      }
      await sink.flush();
      await sink.close();

      final len = await outFile.length();
      if (len <= 0) throw Exception('Downloaded file is empty');
    } finally {
      client.close(force: true);
    }
  }

  Future<void> _prepareLocal() async {
    final url = widget.url.trim();
    if (url.isEmpty) return;

    setState(() {
      _loading = true;
      _error = null;
      _downloadProgress = null;
    });

    try {
      final file = await _cacheFileForUrl(url);

      if (!await file.exists() || await file.length() == 0) {
        await _downloadToFile(url, file);
      }

      _localPath = file.path;

      // ✅ IMPORTANT: play local file only
      await _player.setFilePath(_localPath!);
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = e.toString());
    } finally {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _togglePlay() async {
    if (_loading) return;

    try {
      if (_player.playing) {
        await _player.pause();
        return;
      }

      // if not ready, prepare now
      if (_player.processingState == ProcessingState.idle) {
        await _prepareLocal();
        if (_error != null) return;
      }

      await _player.play();
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = e.toString());
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

    final totalMs = _duration.inMilliseconds <= 0 ? 1 : _duration.inMilliseconds;
    final posMs = _position.inMilliseconds.clamp(0, totalMs);
    final progress = (posMs / totalMs).clamp(0.0, 1.0);

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
                      value: _downloadProgress, // null = indeterminate
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
              _player.playing
                  ? _fmt(_position)
                  : (_duration.inMilliseconds > 0 ? _fmt(_duration) : ""),
              style: TextStyle(color: fg, fontSize: 12),
            ),
            if (_error != null) ...[
              const SizedBox(width: 6),
              Icon(Icons.error_outline, color: fg, size: 16),
            ],
          ],
        ),
      ),
    );
  }
}
