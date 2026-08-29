import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/fade_animation.dart';

import '../../../../core/animations/typing_text.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/secondary_button.dart';

class HerosLeftContent extends StatelessWidget {
  const HerosLeftContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeSlideAnimation(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hassan\nZamin",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 72,
                color: Colors.white,
                fontWeight: FontWeight.w800,
                height: .95,
              ),
            ),

            const SizedBox(height: 28),

            TypingText(
              text:
                  "Digital Growth Expert | Marketing Strategist | Business Consultant",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.grey,
                height: 1.8,
              ),
            ),

            const SizedBox(height: 45),

            Row(
              children: [
                PrimaryButton(text: "Read More", onPressed: () {}),

                const SizedBox(width: 20),

                SecondaryButton(text: "Our Services", onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
