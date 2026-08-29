import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../model/review_model.dart';

class ReviewsCard extends StatelessWidget {
  final ReviewsModel review;

  const ReviewsCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool desktop = width >= 1200;
    final bool tablet = width >= 768 && width < 1200;

    return Container(
      margin: const EdgeInsets.all(20),
      padding: EdgeInsets.all(desktop ? 35 : 22),

      decoration: BoxDecoration(
        color: const Color(0xff2A2757),
        borderRadius: BorderRadius.circular(30),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          /// Stars
          Wrap(
            spacing: 2,
            children: List.generate(
              review.rating.toInt(),
              (_) => Icon(
                Icons.star,
                color: AppColors.yellow,
                size: desktop ? 22 : 18,
              ),
            ),
          ),

          SizedBox(height: desktop ? 25 : 18),

          /// Review Text
          Expanded(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Text(
                review.review,
                style: TextStyle(
                  color: Colors.white,
                  height: 1.7,
                  fontSize: desktop
                      ? 18
                      : tablet
                      ? 16
                      : 14,
                ),
              ),
            ),
          ),

          SizedBox(height: desktop ? 20 : 15),

          /// User
          Row(
            children: [
              CircleAvatar(
                radius: desktop
                    ? 35
                    : tablet
                    ? 30
                    : 24,
                backgroundImage: AssetImage(review.image),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      review.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: desktop ? 18 : 15,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      review.company,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: desktop ? 15 : 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
