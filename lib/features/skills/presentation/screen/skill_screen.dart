import 'package:flutter/material.dart';
import 'package:hassanzamin/features/skills/presentation/widgets/skill_grid.dart';

import '../../../../core/constants/app_colors.dart';
import '../widgets/statistics_row.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,

      padding: const EdgeInsets.symmetric(horizontal: 50),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          const StatisticsRow(),

          const SizedBox(height: 100),

          Align(
            alignment: AlignmentGeometry.topStart,
            child: Text(
              "MY SKILLS",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.yellow,
                letterSpacing: 3,
              ),
            ),
          ),

          const SizedBox(height: 15),

          Align(
            alignment: AlignmentGeometry.topStart,
            child: Text(
              "Expertise That Drives Results",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 60),

          const SkillsGrid(),
        ],
      ),
    );
  }
}
