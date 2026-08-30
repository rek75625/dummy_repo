import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:provider/provider.dart';

class HoverScaleAnimation extends StatelessWidget {
  final Widget child;
  final int index;

  const HoverScaleAnimation({
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
      child: AnimatedScale(
        scale: isHovered ? 1.04 : 1,
        duration: const Duration(milliseconds: 250),
        child: child,
      ),
    );
  }
}
