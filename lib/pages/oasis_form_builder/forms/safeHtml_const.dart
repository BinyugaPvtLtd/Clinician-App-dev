import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

/// A safe wrapper around [Html] that guarantees bounded constraints,
/// preventing the RenderCSSBox / RenderBox "not laid out" assertion
/// that flutter_html 3.0.0 throws when given infinite width/height.
class SafeHtml extends StatelessWidget {
  final String? data;
  final Map<String, Style>? style;
  final bool shrinkWrap;

  const SafeHtml({
    super.key,
    required this.data,
    this.style,
    this.shrinkWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    final String safeData = data ?? '';

    // If data is empty, render nothing — avoids Html rendering an empty
    // layout that can still trigger the constraint assertion.
    if (safeData.trim().isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        // Guarantee a finite width is always available.
        // Falls back to screen width if parent gives us infinity.
        final double safeWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width;

        return SizedBox(
          width: safeWidth,
          child: Html(
            data: safeData,
            shrinkWrap: shrinkWrap,
            style: style ?? {},
          ),
        );
      },
    );
  }
}