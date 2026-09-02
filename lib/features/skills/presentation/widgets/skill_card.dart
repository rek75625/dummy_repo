import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:hassanzamin/features/skills/model/skill_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';

class SkillCard extends StatefulWidget {
  final SkillPageData skill;
  final int index;

  const SkillCard({super.key, required this.skill, required this.index});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  @override
  Widget build(BuildContext context) {
    final isHovered = context.select<MouseRegionProvider, bool>(
      (provider) => provider.isHovered(widget.index),
    );
    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        context.read<MouseRegionProvider>().setHover(widget.index);
      },

      onExit: (_) {
        context.read<MouseRegionProvider>().clearHover(widget.index);
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        transform: Matrix4.identity()
          ..translateByDouble(0, isHovered ? -10 : 0, 0, 1)
          ..scaleByDouble(isHovered ? 1.03 : 1.0, isHovered ? 1.03 : 1.0, 1, 1),

        padding: const EdgeInsets.all(30),

        decoration: BoxDecoration(
          color: const Color(0xff2A2757),

          borderRadius: BorderRadius.circular(25),

          boxShadow: isHovered
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
              turns: isHovered ? 1 : 0,
              duration: const Duration(milliseconds: 600),
              child: Icon(widget.skill.icon, color: AppColors.yellow, size: 42),
            ),

            const SizedBox(height: 10),

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
