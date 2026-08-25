import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: AppColors.yellow,

        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(
        children: [
          Text(
            "250+",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Completed Projects",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
