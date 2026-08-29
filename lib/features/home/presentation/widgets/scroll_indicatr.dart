import 'package:flutter/material.dart';

class ScrollingIndicator extends StatefulWidget {
  const ScrollingIndicator({super.key});

  @override
  State<ScrollingIndicator> createState() => _ScrollingIndicatorState();
}

class _ScrollingIndicatorState extends State<ScrollingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, _) {
          return Transform.translate(
            offset: Offset(0, controller.value * 12),
            child: const Icon(
              Icons.keyboard_double_arrow_down,
              color: Colors.white70,
              size: 32,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
