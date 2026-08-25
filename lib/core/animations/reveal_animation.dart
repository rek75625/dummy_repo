import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RevealAnimation extends StatelessWidget {
  final Widget child;
  final Duration delay;

  const RevealAnimation({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  Widget build(BuildContext context) {
    return child
        .animate(delay: delay)
        .fadeIn(duration: 700.ms)
        .slideY(begin: .2, end: 0, duration: 700.ms);
  }
}
