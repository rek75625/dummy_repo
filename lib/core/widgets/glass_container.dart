import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;

  final double radius;

  const GlassContainer({super.key, required this.child, this.radius = 20});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),

        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .08),

            borderRadius: BorderRadius.circular(radius),

            border: Border.all(color: Colors.white.withValues(alpha: .1)),
          ),

          child: child,
        ),
      ),
    );
  }
}
