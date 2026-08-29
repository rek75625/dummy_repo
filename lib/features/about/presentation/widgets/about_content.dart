import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hassanzamin/core/animations/fade_animation.dart';
import 'package:hassanzamin/core/animations/heros_buttons.dart';
import 'package:provider/provider.dart';

import '../../provider/about_provider.dart';
import 'about_feature_item.dart';

class AboutContents extends StatelessWidget {
  final bool only;
  const AboutContents({super.key, required this.only});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AboutProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ABOUT ME
        Text(
          "ABOUT ME",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Colors.amber.shade600,
            letterSpacing: 2,
          ),
        ).animate().fadeIn(duration: 700.ms).slideY(begin: .3, end: 0),

        SizedBox(height: 20),

        /// Heading
        Text(
              "Digital Growth Strategist & Business Transformation Expert",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
            .animate()
            .fadeIn(delay: 200.ms, duration: 700.ms)
            .slideX(begin: .2, end: 0),

        const SizedBox(height: 30),

        /// Description
        Text(
              "I help businesses increase revenue using performance marketing, business strategy, and digital transformation. My focus is building scalable systems that generate measurable results.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white70,
                height: 1.8,
              ),
            )
            .animate()
            .fadeIn(delay: 400.ms, duration: 700.ms)
            .slideY(begin: .2, end: 0),

        SizedBox(height: 35),

        /// Features
        ...provider.features.asMap().entries.map(
          (entry) => AboutFeaturesItem(title: entry.value)
              .animate()
              .fadeIn(delay: (600 + entry.key * 150).ms, duration: 500.ms)
              .slideX(begin: .2, end: 0),
        ),
        SizedBox(height: 16),
        FadeSlideAnimation(
          delay: Duration(milliseconds: 600),
          child: HerosButtons(
            readmore: "Read More",
            only: only,
            onPressed: () {
              context.pushNamed('about');
            },
          ),
        ),
      ],
    );
  }
}
