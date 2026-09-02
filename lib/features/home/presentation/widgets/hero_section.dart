import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/fade_animation.dart';
import 'package:hassanzamin/core/animations/floating_animation.dart';
import 'package:hassanzamin/core/animations/typing_text.dart';
import 'package:hassanzamin/core/constants/app_colors.dart';
import 'package:hassanzamin/features/home/presentation/widgets/hero_particles.dart';
import 'package:hassanzamin/features/home/presentation/widgets/scroll_indicatr.dart';
import 'package:hassanzamin/repositories/responsive.dart';

import 'background_painter.dart';
import 'floating_shapes.dart';
import 'hero_buttons.dart';

class HeroSections extends StatelessWidget {
  const HeroSections({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          /// Background
          HomeBackgroundPainter(),

          /// Animated particles
          HerosParticles(),

          /// Floating decorative shapes
          FloatingShape(),

          /// Responsive Hero Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isDesktop(context)
                    ? 50
                    : Responsive.isTablet(context)
                    ? 40
                    : 20,
              ),
              child: SizedBox(
                height: Responsive.isDesktop(context) ? 800 : null,
                child: Responsive.isDesktop(context)
                    ? _desktopLayout(context)
                    : Responsive.isTablet(context)
                    ? _tabletLayout(context)
                    : _mobileLayout(context),
              ),
            ),
          ),

          /// Scroll Indicator
          ScrollingIndicator(),
        ],
      ),
    );
  }

  //==========================
  // Desktop Layout
  //==========================

  Widget _desktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: _textSection(
            context,
            textAlign: TextAlign.left,
            crossAxisAlignment: CrossAxisAlignment.start,
            titleStyle: Theme.of(context).textTheme.displayLarge!,
          ),
        ),

        const SizedBox(width: 60),

        Expanded(
          flex: 4,
          child: Center(child: _heroImage(width: 500, height: 650)),
        ),
      ],
    );
  }

  //==========================
  // Tablet Layout
  //==========================

  Widget _tabletLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),

          _textSection(
            context,
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            titleStyle: Theme.of(context).textTheme.displayMedium!,
          ),

          const SizedBox(height: 50),

          _heroImage(width: 750, height: 700),

          const SizedBox(height: 50),
        ],
      ),
    );
  }

  //==========================
  // Mobile Layout
  //==========================

  Widget _mobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),

          _textSection(
            context,
            textAlign: TextAlign.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            titleStyle: Theme.of(context).textTheme.headlineLarge!,
          ),

          const SizedBox(height: 40),

          _heroImage(width: 440, height: 440),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  //==========================
  // Shared Text Section
  //==========================

  Widget _textSection(
    BuildContext context, {
    required TextAlign textAlign,
    required CrossAxisAlignment crossAxisAlignment,
    required TextStyle titleStyle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        FadeSlideAnimation(
          child: Text(
            "Hassan Zamin",
            textAlign: textAlign,
            style: titleStyle.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              height: .95,
            ),
          ),
        ),

        SizedBox(height: 20),

        FadeSlideAnimation(
          delay: Duration(milliseconds: 300),
          child: SizedBox(
            width: 650,
            child: TypingText(
              text:
                  "Digital Growth Expert | Marketing Strategist | Business Consultant | Helping Businesses Achieve Success in the Digital Era with 15+ years of experience | Let's Connect and Explore Opportunities Togather!",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.grey,
                height: 1.7,
              ),
            ),
          ),
        ),

        SizedBox(height: 20),

        FadeSlideAnimation(
          delay: Duration(milliseconds: 600),
          child: HerosButtons(),
        ),
      ],
    );
  }

  //==========================
  // Shared Hero Image
  //==========================

  Widget _heroImage({required double width, required double height}) {
    return FloatingAnimation(
      child: Hero(
        tag: "heroImage",
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                blurRadius: 40,
                color: Colors.black38,
                offset: Offset(0, 20),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/images/hassanzamin.jpeg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
