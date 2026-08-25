import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/fade_animation.dart';
import 'package:hassanzamin/core/animations/heros_buttons.dart';
import 'package:hassanzamin/features/home/provider/home_provider.dart';
import 'package:hassanzamin/features/partners/presentation/widgets/auto-scroll_logo.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';

class PartnersSection extends StatelessWidget {
  const PartnersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 100),
      color: AppColors.background,
      child: Column(
        children: [
          Text(
            "TRUSTED BY",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.yellow,
              letterSpacing: 3,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            "Brands I've Worked With",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "We proudly collaborate with innovative brands and growing businesses worldwide.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 60),

          const AutoScrollLogos(),
          SizedBox(height: 40),
          FadeSlideAnimation(
            delay: Duration(milliseconds: 600),
            child: SizedBox(
              width: 300,
              child: HerosButtons(
                readmore: "Read More",
                only: true,
                onPressed: () {
                  context.read<HomeProvider>().openPartners();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
