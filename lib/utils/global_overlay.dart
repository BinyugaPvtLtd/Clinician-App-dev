import 'package:flutter/material.dart';

class GlobalOverlay {
  static final GlobalOverlay _instance = GlobalOverlay._internal();
  factory GlobalOverlay() => _instance;
  GlobalOverlay._internal();

  OverlayEntry? _entry;

  void show({
    required BuildContext context,
    required Widget child,
    bool dismissOnTapOutside = true,
    Color backgroundColor = Colors.black54,
  }) {
    if (_entry != null) return; // Avoid stacking

    _entry = OverlayEntry(
      builder:
          (_) => Stack(
            children: [
              if (dismissOnTapOutside)
                GestureDetector(
                  onTap: hide,
                  child: Container(color: backgroundColor),
                ),
              child,
            ],
          ),
    );

    Overlay.of(context).insert(_entry!);
  }

  void hide() {
    _entry?.remove();
    _entry = null;
  }
}
