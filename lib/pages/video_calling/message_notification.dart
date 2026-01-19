
import 'dart:ui';

import 'package:flutter/material.dart';

class TopToastEntry extends StatefulWidget {
  final String title;
  final String message;
  final Duration duration;
  final VoidCallback onOpen;
  final VoidCallback onDismiss;

  const TopToastEntry({
    required this.title,
    required this.message,
    required this.duration,
    required this.onOpen,
    required this.onDismiss,
  });

  @override
  State<TopToastEntry> createState() => TopToastEntryState();
}

class TopToastEntryState extends State<TopToastEntry>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
      reverseDuration: const Duration(milliseconds: 180),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, -0.25),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _c, curve: Curves.easeOutCubic));

    _fade = CurvedAnimation(parent: _c, curve: Curves.easeOut);

    _c.forward();

    Future.delayed(widget.duration, () async {
      if (!mounted) return;
      await _c.reverse();
      if (mounted) widget.onDismiss();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  Future<void> _dismiss() async {
    await _c.reverse();
    if (mounted) widget.onDismiss();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: false,
      child: SafeArea(
        child: Align(
          alignment: Alignment.topCenter, // ✅ upper side
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: FadeTransition(
              opacity: _fade,
              child: SlideTransition(
                position: _slide,
                child: GestureDetector(
                  onVerticalDragUpdate: (d) {
                    // swipe up to dismiss
                    if (d.delta.dy < -6) _dismiss();
                  },
                  child: TeamsMessageCard(
                    title: widget.title,
                    message: widget.message,
                    onOpen: widget.onOpen,
                    onDismiss: _dismiss,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TeamsMessageCard extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onOpen;
  final VoidCallback onDismiss;

  const TeamsMessageCard({
    Key? key,
    required this.title,
    required this.message,
    required this.onOpen,
    required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chat_bubble_outline,
                    size: 18,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(width: 12),

                // Texts
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: onDismiss,
                            child: const Text("Dismiss"),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: onOpen,
                            child: const Text(
                              "Open",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Close X
                GestureDetector(
                  onTap: onDismiss,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



SnackBar buildIncomingCallSnackBar({
  required String callerName,
  String? profileUrl,
  required VoidCallback onAccept,
  required VoidCallback onReject,
}) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(12),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    duration: const Duration(seconds: 30), // stays visible like a call alert
    dismissDirection: DismissDirection.none,
    backgroundColor: Colors.black87,
    content: Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.grey.shade700,
          backgroundImage:
          (profileUrl != null && profileUrl.isNotEmpty) ? NetworkImage(profileUrl) : null,
          child: (profileUrl == null || profileUrl.isEmpty)
              ? const Icon(Icons.person, color: Colors.white)
              : null,
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Incoming call",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 2),
              Text(
                callerName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),

        const SizedBox(width: 8),

        TextButton(
          onPressed: onReject,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.redAccent,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text("Reject"),
        ),

        const SizedBox(width: 8),

        TextButton(
          onPressed: onAccept,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text("Accept"),
        ),
      ],
    ),
  );
}
