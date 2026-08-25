import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/review_provider.dart';
import '../../../../core/constants/app_colors.dart';

class ReviewIndicator extends StatelessWidget {
  const ReviewIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReviewProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: List.generate(provider.reviews.length, (index) {
        final selected = provider.currentPage == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),

          margin: const EdgeInsets.all(5),

          width: selected ? 35 : 10,

          height: 10,

          decoration: BoxDecoration(
            color: selected ? AppColors.yellow : Colors.white24,
            borderRadius: BorderRadius.circular(50),
          ),
        );
      }),
    );
  }
}
