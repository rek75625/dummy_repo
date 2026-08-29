import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/review_provider.dart';
import 'review_card.dart';

class ReviewsSlider extends StatelessWidget {
  const ReviewsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReviewsProvider>();

    final width = MediaQuery.of(context).size.width;

    final double height;

    if (width >= 1200) {
      height = 350;
    } else if (width >= 768) {
      height = 320;
    } else {
      height = 300;
    }

    return SizedBox(
      height: height,

      child: PageView.builder(
        controller: provider.pageController,
        itemCount: provider.reviews.length,

        itemBuilder: (_, index) {
          return ReviewsCard(review: provider.reviews[index]);
        },
      ),
    );
  }
}
