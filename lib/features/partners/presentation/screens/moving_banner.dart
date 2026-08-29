import 'package:flutter/material.dart';
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
      height: 72,
      decoration: BoxDecoration(
        color: const Color(0xFF25204F),
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
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.auto_awesome,
                    size: 18,
                    color: Color(0xFFF8F54B),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    skill,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
