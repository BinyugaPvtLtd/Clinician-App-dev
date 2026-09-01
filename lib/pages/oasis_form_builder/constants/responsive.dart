import 'package:flutter/material.dart';
import 'package:clinician_app/main.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(navigatorKey.currentContext ?? context).size.width < 834;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(navigatorKey.currentContext ?? context).size.width >=
          834 &&
      MediaQuery.of(navigatorKey.currentContext ?? context).size.width < 1280;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(navigatorKey.currentContext ?? context).size.width >= 1280;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: Builder(
        builder: (context) {
          if (size.width >= 1280) {
            return desktop;
          } else if (size.width >= 834) {
            return tablet;
          } else {
            return mobile ?? tablet;
          }
        },
      ),
    );
  }
}
