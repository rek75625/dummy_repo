import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;

  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),

        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .06),

            borderRadius: BorderRadius.circular(24),

            border: Border.all(color: Colors.white.withValues(alpha: .08)),
          ),

          child: child,
        ),
      ),
    );
  }
}
