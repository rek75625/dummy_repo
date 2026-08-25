import 'package:flutter/material.dart';
import 'package:hassanzamin/repositories/responsive.dart';

import 'experience_card.dart';

class AboutImages extends StatelessWidget {
  const AboutImages({super.key});

  @override
  Widget build(BuildContext context) {
    final bool desktop = Responsive.isDesktop(context);
    final bool tablet = Responsive.isTablet(context);

    final double screenWidth = MediaQuery.of(context).size.width;

    final double bigWidth = desktop
        ? 480
        : tablet
        ? 360
        : screenWidth * 0.75;

    final double bigHeight = desktop
        ? 500
        : tablet
        ? 430
        : 360;

    final double smallWidth = desktop
        ? 260
        : tablet
        ? 220
        : 170;

    final double smallHeight = desktop
        ? 300
        : tablet
        ? 240
        : 180;

    return Center(
      child: SizedBox(
        width: bigWidth + (desktop ? 120 : 70),
        height: bigHeight + 70,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /// Main Image
            Positioned(
              left: 0,
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/images/aboutme.jpeg",
                  width: bigWidth,
                  height: bigHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// Small Image
            Positioned(
              right: 80,
              bottom: -20,
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(300),
                  bottomStart: Radius.circular(30),
                  bottomEnd: Radius.circular(30),
                ),
                child: Image.asset(
                  "assets/images/aboutme.jpeg",
                  width: smallWidth,
                  height: smallHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// Experience Card
            Positioned(
              left: desktop ? 80 : 20,
              bottom: -20,
              child: const ExperienceCard(),
            ),
          ],
        ),
      ),
    );
  }
}
