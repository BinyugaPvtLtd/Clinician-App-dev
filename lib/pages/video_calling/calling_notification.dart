import 'dart:ui';
import 'package:flutter/material.dart';

class AndroidIncomingCallOverlay extends StatefulWidget {
  final String callerName;
  final VoidCallback onAccept;
  final VoidCallback onReject;
  final String? userImage;

  const AndroidIncomingCallOverlay({
    super.key,
    required this.callerName,
    required this.onAccept,
    required this.onReject,
    this.userImage,
  });

  @override
  State<AndroidIncomingCallOverlay> createState() =>
      _AndroidIncomingCallOverlayState();
}

class _AndroidIncomingCallOverlayState extends State<AndroidIncomingCallOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.callerName.trim().isEmpty ? "Unknown" : widget.callerName.trim();
    final initial = name.isNotEmpty ? name[0].toUpperCase() : "?";

    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Stack(
          children: [
            // Background (dim + blur)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                child: Container(
                  color: Colors.black.withOpacity(0.55),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
                  const Spacer(),

                  // Avatar with subtle pulse ring (Android-ish)
                  _PulsingAvatar(
                    controller: _pulseController,
                    imageUrl: widget.userImage,
                    initial: initial,
                  ),

                  const SizedBox(height: 18),

                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Incoming call",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.78),
                    ),
                  ),

                  const Spacer(),

                  // Big bottom buttons
                  Row(
                    children: [
                      Expanded(
                        child: _CallActionButton(
                          label: "Decline",
                          icon: Icons.call_end,
                          background: const Color(0xFFE53935),
                          onTap: widget.onReject,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: _CallActionButton(
                          label: "Answer",
                          icon: Icons.call,
                          background: const Color(0xFF2E7D32),
                          onTap: widget.onAccept,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Optional small hint row
                  Text(
                    "Tap to respond",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.55),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PulsingAvatar extends StatelessWidget {
  final AnimationController controller;
  final String? imageUrl;
  final String initial;

  const _PulsingAvatar({
    required this.controller,
    required this.imageUrl,
    required this.initial,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl != null && imageUrl!.trim().isNotEmpty;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        // 0..1 -> ring expands a bit and fades
        final t = controller.value;
        final ringScale = 1.0 + (t * 0.18);
        final ringOpacity = 0.30 - (t * 0.18);

        return Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: ringScale,
              child: Container(
                width: 118,
                height: 118,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(ringOpacity.clamp(0.05, 0.30)),
                ),
              ),
            ),
            Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.10),
                border: Border.all(
                  color: Colors.white.withOpacity(0.18),
                  width: 1,
                ),
              ),
              child: ClipOval(
                child: hasImage
                    ? Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _InitialAvatar(initial: initial),
                )
                    : _InitialAvatar(initial: initial),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _InitialAvatar extends StatelessWidget {
  final String initial;
  const _InitialAvatar({required this.initial});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.10),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _CallActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color background;
  final VoidCallback onTap;

  const _CallActionButton({
    required this.label,
    required this.icon,
    required this.background,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(999),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 16,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
