import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../widgets/portfolio_filter.dart';
import '../widgets/portfolio_grid.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 120),
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PORTFOLIO",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.yellow,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "Recent Work & Trainings",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          PortfolioFilter(),
          SizedBox(height: 50),
          PortfoliosGrid(),
        ],
      ),
    );
  }
}
