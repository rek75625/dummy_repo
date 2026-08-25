// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ParallaxAnimation extends StatefulWidget {
  final Widget child;

  const ParallaxAnimation({super.key, required this.child});

  @override
  State<ParallaxAnimation> createState() => _ParallaxAnimationState();
}

class _ParallaxAnimationState extends State<ParallaxAnimation> {
  Offset offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (e) {
        setState(() {
          offset = Offset(
            (e.localPosition.dx - 150) * .02,
            (e.localPosition.dy - 150) * .02,
          );
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        transform: Matrix4.identity()..translate(offset.dx, offset.dy),
        child: widget.child,
      ),
    );
  }
}
