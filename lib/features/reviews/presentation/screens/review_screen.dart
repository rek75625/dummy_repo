import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../widgets/review_indicator.dart';
import '../widgets/review_slider.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.background,

      padding: EdgeInsets.symmetric(
        horizontal: width >= 1200
            ? 0
            : width >= 768
            ? 0
            : 0,
        vertical: width >= 768 ? 80 : 60,
      ),

      child: Column(
        children: [
          Text(
            "TESTIMONIALS",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.yellow,
              letterSpacing: 3,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "What Clients Say",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 30),

          ReviewsSlider(),

          SizedBox(height: 20),

          ReviewsIndicator(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
