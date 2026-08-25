import 'package:flutter/material.dart';

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
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedScale(
        scale: hover ? 1.04 : 1,
        duration: const Duration(milliseconds: 250),
        child: widget.child,
      ),
    );
  }
}
