import 'dart:math';
import 'package:flutter/material.dart';

class HeroParticles extends StatelessWidget {
  const HeroParticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: List.generate(20, (index) {
            final random = Random(index);

            return Positioned(
              left: random.nextDouble() * MediaQuery.of(context).size.width,
              top: random.nextDouble() * MediaQuery.of(context).size.height,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.6, end: 1),
                duration: Duration(seconds: 2 + random.nextInt(3)),
                curve: Curves.easeInOut,
                builder: (_, value, child) {
                  return Opacity(
                    opacity: value * .4,
                    child: Transform.scale(scale: value, child: child),
                  );
                },
                child: Container(
                  width: 5 + random.nextDouble() * 5,
                  height: 5 + random.nextDouble() * 5,
                  decoration: const BoxDecoration(
                    color: Color(0xffF8F54B),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
