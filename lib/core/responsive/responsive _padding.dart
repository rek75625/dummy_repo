// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ResponsivePadding extends StatelessWidget {
  final Widget child;

  const ResponsivePadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    double horizontal = 20;

    if (width >= 1024) {
      horizontal = 90;
    } else if (width >= 768) {
      horizontal = 40;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: child,
    );
  }
}
