import 'package:flutter/material.dart';

import 'breakpoints.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < BreakPoints.mobile) {
      return mobile;
    }

    if (width < BreakPoints.tablet) {
      return tablet;
    }

    return desktop;
  }
}
