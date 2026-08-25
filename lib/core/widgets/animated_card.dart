import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class AnimatedCardWidget extends StatefulWidget {
  final Widget child;

  const AnimatedCardWidget({super.key, required this.child});

  @override
  State<AnimatedCardWidget> createState() => _AnimatedCardWidgetState();
}

class _AnimatedCardWidgetState extends State<AnimatedCardWidget> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),

      onExit: (_) => setState(() => hover = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        curve: Curves.easeOut,

        transform: Matrix4.identity()
          ..translateByVector3(Vector3(0.0, hover ? -12.0 : 0.0, 0.0))
          ..scaleByVector3(
            Vector3(hover ? 1.03 : 1.0, hover ? 1.03 : 1.0, 1.0),
          ),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),

          boxShadow: hover
              ? [
                  BoxShadow(
                    blurRadius: 30,
                    spreadRadius: 2,
                    color: Colors.yellow.withValues(alpha: .18),
                  ),
                ]
              : [],
        ),

        child: widget.child,
      ),
    );
  }
}
