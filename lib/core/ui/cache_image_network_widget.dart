import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A reusable widget for loading network images with caching, error handling, and a loading indicator.
class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? radius;

  /// Constructor to initialize image properties.
  const CachedNetworkImageWidget(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.fit = BoxFit.cover,
      this.placeholder,
      this.errorWidget,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular((radius ?? 0).r)),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) =>
            placeholder ??
            FadeShimmer(
                width: width ?? double.maxFinite,
                height: height ?? 50,
                // fadeTheme: FadeTheme.dark,
                baseColor: Colors.white,
                highlightColor: const Color(0xFFDDDEDF)),
        errorWidget: (context, url, error) =>
            errorWidget ??
            const SizedBox(
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
      ),
    );
  }
}
