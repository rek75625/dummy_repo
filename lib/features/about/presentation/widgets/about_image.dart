import 'package:flutter/material.dart';
import 'package:hassanzamin/repositories/responsive.dart';

import 'experience_card.dart';

class AboutsImages extends StatelessWidget {
  const AboutsImages({super.key});

  @override
  Widget build(BuildContext context) {
    final bool tablet = Responsive.isTablet(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        // ============================================================
        // RESPONSIVE DIMENSIONS
        // ============================================================

        final bool mobile = width < 768;

        final double containerWidth = mobile
            ? width.clamp(280.0, 560.0)
            : tablet
            ? width.clamp(500.0, 760.0)
            : width.clamp(650.0, 900.0);

        final double containerHeight = mobile
            ? 500
            : tablet
            ? 540
            : 800;

        final double mainImageWidth = mobile
            ? containerWidth * .82
            : tablet
            ? containerWidth * .76
            : containerWidth * .80;

        final double mainImageHeight = mobile
            ? 380
            : tablet
            ? 430
            : 700;

        final double secondarySize = mobile
            ? 145
            : tablet
            ? 190
            : 230;

        return Center(
          child: SizedBox(
            width: containerWidth,
            height: containerHeight,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // ======================================================
                // DECORATIVE BACKGROUND SHAPE
                // ======================================================

                Positioned(
                  top: mobile ? 15 : 0,
                  right: mobile ? 10 : 35,
                  child: Container(
                    width: mobile
                        ? 210
                        : tablet
                        ? 270
                        : 330,
                    height: mobile
                        ? 210
                        : tablet
                        ? 270
                        : 330,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xffFFF343).withValues(alpha: .20),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                // ======================================================
                // SECOND DECORATIVE CIRCLE
                // ======================================================
                Positioned(
                  top: mobile ? 45 : 30,
                  right: mobile ? 40 : 75,
                  child: Container(
                    width: mobile
                        ? 150
                        : tablet
                        ? 200
                        : 250,
                    height: mobile
                        ? 150
                        : tablet
                        ? 200
                        : 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffFFF343).withValues(alpha: .035),
                    ),
                  ),
                ),

                // ======================================================
                // MAIN IMAGE
                // ======================================================
                Positioned(
                  left: 0,
                  top: mobile ? 35 : 20,
                  child: _MainImage(
                    width: mainImageWidth,
                    height: mainImageHeight,
                  ),
                ),

                // ======================================================
                // IMAGE NUMBER / LABEL
                // ======================================================
                Positioned(
                  left: mobile ? 18 : 30,
                  top: mobile ? 55 : 40,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: .55),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: .15),
                      ),
                    ),
                    child: const Text(
                      'ABOUT ME',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ),
                ),

                // ======================================================
                // YELLOW ACCENT LINE
                // ======================================================
                Positioned(
                  left: 0,
                  top: mobile ? 430 : 485,
                  child: Container(
                    width: mobile
                        ? 75
                        : tablet
                        ? 100
                        : 130,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFF343),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                // ======================================================
                // SECONDARY IMAGE
                // ======================================================
                Positioned(
                  right: mobile ? 5 : 20,
                  top: mobile
                      ? 285
                      : tablet
                      ? 305
                      : 345,
                  child: _SecondaryImage(size: secondarySize),
                ),

                // ======================================================
                // EXPERIENCE CARD
                // ======================================================
                Positioned(
                  left: mobile
                      ? 10
                      : tablet
                      ? 25
                      : 50,
                  bottom: mobile
                      ? 5
                      : tablet
                      ? 0
                      : -5,
                  child: const ExperienceCardnTag(),
                ),

                // ======================================================
                // FLOATING YELLOW DOTS
                // ======================================================
                Positioned(
                  right: mobile ? 35 : 65,
                  top: mobile ? 270 : 300,
                  child: _Dot(size: mobile ? 7 : 9),
                ),

                Positioned(
                  right: mobile ? 80 : 125,
                  top: mobile ? 245 : 275,
                  child: _Dot(size: mobile ? 4 : 6),
                ),

                // ======================================================
                // SMALL CROSS DECORATION
                // ======================================================
                Positioned(
                  right: mobile ? 15 : 5,
                  bottom: mobile ? 105 : 125,
                  child: const _CrossDecoration(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ============================================================================
// MAIN IMAGE
// ============================================================================

class _MainImage extends StatelessWidget {
  final double width;
  final double height;

  const _MainImage({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .25),
            blurRadius: 35,
            offset: const Offset(0, 25),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/aboutme.jpeg',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              errorBuilder: (_, _, _) {
                return Container(
                  color: const Color(0xff17152F),
                  child: const Icon(
                    Icons.person_rounded,
                    color: Colors.white24,
                    size: 80,
                  ),
                );
              },
            ),

            // Dark gradient
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: .05),
                    Colors.black.withValues(alpha: .08),
                    Colors.black.withValues(alpha: .60),
                  ],
                  stops: const [0, .45, 1],
                ),
              ),
            ),

            // Yellow glow
            Positioned(
              right: -70,
              bottom: -70,
              child: Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xffFFF343).withValues(alpha: .12),
                ),
              ),
            ),

            // Bottom label
            Positioned(
              left: 22,
              bottom: 20,
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 2,
                    color: const Color(0xffFFF343),
                  ),
                  const SizedBox(width: 9),
                  Text(
                    'DIGITAL MARKETING',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: .80),
                      fontSize: 8,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// SECONDARY IMAGE
// ============================================================================

class _SecondaryImage extends StatelessWidget {
  final double size;

  const _SecondaryImage({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: const Color(0xff242052),
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xffFFF343).withValues(alpha: .55),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .35),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/aboutme.jpeg',
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          errorBuilder: (_, _, _) {
            return Container(
              color: const Color(0xff17152F),
              child: const Icon(
                Icons.person_rounded,
                color: Colors.white24,
                size: 45,
              ),
            );
          },
        ),
      ),
    );
  }
}

// ============================================================================
// SMALL DOT
// ============================================================================

class _Dot extends StatelessWidget {
  final double size;

  const _Dot({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffFFF343),
      ),
    );
  }
}

// ============================================================================
// CROSS DECORATION
// ============================================================================

class _CrossDecoration extends StatelessWidget {
  const _CrossDecoration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 1,
            height: 30,
            color: const Color(0xffFFF343).withValues(alpha: .45),
          ),
          Container(
            width: 30,
            height: 1,
            color: const Color(0xffFFF343).withValues(alpha: .45),
          ),
        ],
      ),
    );
  }
}
