import 'package:flutter/material.dart';
import 'package:hassanzamin/core/constants/app_colors.dart';
import 'package:marqueer/marqueer.dart';

class MotionBanners extends StatelessWidget {
  const MotionBanners({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      "Digital Growth Strategist",
      "Marketing Expert",
      "Business Consultant",
      "Digital Transformation",
      "Business Growth",
      "Performance Marketing",
      "Digital Marketing",
      "Business Strategy",
    ];

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
          bottom: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      child: Marqueer(
        pps: 55,
        direction: MarqueerDirection.rtl,
        child: Row(
          children: skills.map((skill) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
              ),
              child: Text(
                skill,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
