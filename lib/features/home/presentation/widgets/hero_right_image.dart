import 'package:flutter/material.dart';
import 'package:hassanzamin/core/widgets/animated_card.dart';

import '../../../../core/animations/floating_animation.dart';
import '../../../../core/widgets/glass_card.dart';

class HeroRightImage extends StatelessWidget {
  const HeroRightImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: FloatingAnimation(
          child: Hero(
            tag: "profile",
            child: AnimatedCardWidget(
              child: GlassCard(
                child: SizedBox(
                  width: 520,
                  height: 700,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        "assets/images/hassanzamin.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
