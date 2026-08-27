import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:provider/provider.dart';

class HoverScaleAnimation extends StatefulWidget {
  final Widget child;

  const HoverScaleAnimation({super.key, required this.child});

  @override
  State<HoverScaleAnimation> createState() => _HoverScaleAnimationState();
}

class _HoverScaleAnimationState extends State<HoverScaleAnimation> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final isHovered = context.watch<MouseRegionProvider>().hover;
    return MouseRegion(
      onEnter: (_) => context.watch<MouseRegionProvider>().setHover(true),
      onExit: (_) => context.watch<MouseRegionProvider>().setHover(false),
      child: AnimatedScale(
        scale: isHovered ? 1.04 : 1,
        duration: const Duration(milliseconds: 250),
        child: widget.child,
      ),
    );
  }
}
