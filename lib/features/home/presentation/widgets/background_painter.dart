import 'package:flutter/material.dart';
import 'package:hassanzamin/core/painter/hero_background_painter.dart';

import '../../../../core/constants/app_colors.dart';

class HomeBackgroundPainter extends StatelessWidget {
  const HomeBackgroundPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.background, Color(0xff302A67)],
            ),
          ),
        ),

        Positioned.fill(child: CustomPaint(painter: HeroBackgroundPainter())),
      ],
    );
  }
}
