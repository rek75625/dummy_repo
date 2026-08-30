import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class AnimatedCardWidget extends StatelessWidget {
  final Widget child;
  final int index;

  const AnimatedCardWidget({
    super.key,
    required this.child,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isHovered = context.select<MouseRegionProvider, bool>(
      (provider) => provider.isHovered(index),
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        context.read<MouseRegionProvider>().setHover(index);
      },

      onExit: (_) {
        context.read<MouseRegionProvider>().clearHover(index);
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: Matrix4.identity()
          ..translateByVector3(Vector3(0.0, isHovered ? -12.0 : 0.0, 0.0))
          ..scaleByVector3(
            Vector3(isHovered ? 1.03 : 1.0, isHovered ? 1.03 : 1.0, 1.0),
          ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    blurRadius: 30,
                    spreadRadius: 2,
                    color: Colors.yellow.withValues(alpha: .18),
                  ),
                ]
              : [],
        ),
        child: child,
      ),
    );
  }
}
