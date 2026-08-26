import 'package:flutter/material.dart';
import 'package:hassanzamin/features/skills/model/skill_model.dart';

import '../../../../core/constants/app_colors.dart';

class SkillCard extends StatefulWidget {
  final SkillPageData skill;

  const SkillCard({super.key, required this.skill});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),

      onExit: (_) => setState(() => hover = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        transform: Matrix4.identity()
          ..translateByDouble(0, hover ? -10 : 0, 0, 1)
          ..scaleByDouble(hover ? 1.03 : 1.0, hover ? 1.03 : 1.0, 1, 1),

        padding: const EdgeInsets.all(30),

        decoration: BoxDecoration(
          color: const Color(0xff2A2757),

          borderRadius: BorderRadius.circular(25),

          boxShadow: hover
              ? [
                  BoxShadow(
                    color: AppColors.yellow.withValues(alpha: .25),
                    blurRadius: 25,
                  ),
                ]
              : [],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            AnimatedRotation(
              turns: hover ? 1 : 0,
              duration: const Duration(milliseconds: 600),
              child: Icon(widget.skill.icon, color: AppColors.yellow, size: 42),
            ),

            const SizedBox(height: 20),

            Text(
              widget.skill.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
