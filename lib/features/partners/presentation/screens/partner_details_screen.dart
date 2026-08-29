import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:hassanzamin/core/widgets/custom_appbar.dart';
import 'package:hassanzamin/features/partners/models/partner_model.dart';
import 'package:hassanzamin/features/partners/presentation/widgets/custom_card.dart';
import 'package:hassanzamin/routes/back_to_home.dart';

class PartnersDetailsScreen extends StatelessWidget {
  const PartnersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CompanysModel> companies = CompanyData.companies;

    return Scaffold(
      backgroundColor: const Color(0xFF211E4B),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // =========================================================
            // APP BAR
            // =========================================================
            SliverToBoxAdapter(child: customAppBar(context)),

            // =========================================================
            // HERO
            // =========================================================
            const SliverToBoxAdapter(child: _HeroSection()),

            // =========================================================
            // SECTION TITLE
            // =========================================================
            const SliverToBoxAdapter(child: _PartnersHeader()),

            // =========================================================
            // PARTNERS GRID
            // =========================================================
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 70),
              sliver: SliverLayoutBuilder(
                builder: (BuildContext context, SliverConstraints constraints) {
                  final double width = constraints.crossAxisExtent;

                  // ---------------------------------------------------
                  // BREAKPOINTS
                  // ---------------------------------------------------

                  final bool mobile = width < 600;

                  final bool tablet = width >= 600 && width < 1100;

                  final bool desktop = width >= 1100;

                  // ---------------------------------------------------
                  // COLUMNS
                  // ---------------------------------------------------

                  int columns;

                  if (mobile) {
                    columns = 1;
                  } else if (tablet) {
                    columns = 2;
                  } else if (width < 1450) {
                    columns = 3;
                  } else {
                    columns = 4;
                  }

                  // ---------------------------------------------------
                  // SPACING
                  // ---------------------------------------------------

                  final double spacing = mobile
                      ? 16
                      : tablet
                      ? 20
                      : 24;

                  // ---------------------------------------------------
                  // CARD HEIGHT
                  //
                  // Important:
                  // We intentionally use mainAxisExtent instead
                  // of childAspectRatio.
                  //
                  // This gives CompanyCard enough vertical space
                  // for its logo, title, category, description and
                  // button.
                  // ---------------------------------------------------

                  final double cardHeight;

                  if (mobile) {
                    cardHeight = 390;
                  } else if (tablet) {
                    cardHeight = 365;
                  } else if (desktop && width < 1450) {
                    cardHeight = 350;
                  } else {
                    cardHeight = 350;
                  }

                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate((
                      BuildContext context,
                      int index,
                    ) {
                      final CompanysModel company = companies[index];

                      return CompanysCard(company: company);
                    }, childCount: companies.length),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: spacing,
                      mainAxisSpacing: spacing,
                      mainAxisExtent: cardHeight,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// PARTNERS HEADER
// ============================================================================

class _PartnersHeader extends StatelessWidget {
  const _PartnersHeader();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;

        final bool mobile = width < 600;
        final bool tablet = width >= 600 && width < 1100;

        return Padding(
          padding: EdgeInsets.fromLTRB(
            mobile
                ? 20
                : tablet
                ? 35
                : 55,
            mobile ? 25 : 35,
            mobile
                ? 20
                : tablet
                ? 35
                : 55,
            mobile ? 10 : 15,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "OUR PARTNERS",
                      style: TextStyle(
                        color: const Color(0xFFFFC107),
                        fontSize: mobile ? 11 : 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2.5,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Brands We Work With",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: mobile
                            ? 25
                            : tablet
                            ? 32
                            : 38,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                      ),
                    ),

                    const SizedBox(height: 8),

                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: mobile
                            ? 360
                            : tablet
                            ? 600
                            : 700,
                      ),
                      child: Text(
                        "A selection of ambitious brands and "
                        "organizations we've worked with to create "
                        "meaningful digital growth.",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.65),
                          fontSize: mobile ? 13 : 15,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // --------------------------------------------------------
              // DESKTOP DECORATION
              // --------------------------------------------------------
              if (!mobile)
                Container(
                  width: tablet ? 55 : 70,
                  height: tablet ? 55 : 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFFFC107).withValues(alpha: 0.25),
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_downward_rounded,
                    color: const Color(0xFFFFC107).withValues(alpha: 0.8),
                    size: tablet ? 22 : 28,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

// ============================================================================
// HERO SECTION
// ============================================================================

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;

        // --------------------------------------------------------------
        // BREAKPOINTS
        // --------------------------------------------------------------

        final bool mobile = width < 600;

        final bool tablet = width >= 600 && width < 1100;

        final bool desktop = width >= 1100;

        // --------------------------------------------------------------
        // HERO HEIGHT
        // --------------------------------------------------------------

        final double heroHeight;

        if (mobile) {
          heroHeight = 330;
        } else if (tablet) {
          heroHeight = 350;
        } else {
          heroHeight = 390;
        }

        // --------------------------------------------------------------
        // HORIZONTAL MARGIN
        // --------------------------------------------------------------

        final double horizontalMargin;

        if (mobile) {
          horizontalMargin = 16;
        } else if (tablet) {
          horizontalMargin = 30;
        } else {
          horizontalMargin = 55;
        }

        // --------------------------------------------------------------
        // BORDER RADIUS
        // --------------------------------------------------------------

        final double radius = mobile
            ? 20
            : tablet
            ? 25
            : 30;

        return Container(
          height: heroHeight,
          margin: EdgeInsets.fromLTRB(
            horizontalMargin,
            mobile ? 10 : 20,
            horizontalMargin,
            mobile ? 15 : 25,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // ======================================================
                // BACKGROUND IMAGE
                // ======================================================
                Image.asset(
                  "assets/images/aboutus.png",
                  fit: BoxFit.cover,

                  errorBuilder:
                      (
                        BuildContext context,
                        Object error,
                        StackTrace? stackTrace,
                      ) {
                        return const _HeroFallbackBackground();
                      },
                ),

                // ======================================================
                // OVERLAY
                // ======================================================
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF211E4B).withValues(alpha: 0.75),
                        const Color(0xFF211E4B).withValues(alpha: 0.35),
                        Colors.black.withValues(alpha: 0.60),
                      ],
                    ),
                  ),
                ),

                // ======================================================
                // TOP RIGHT GLOW
                // ======================================================
                Positioned(
                  top: -80,
                  right: -80,
                  child: Container(
                    width: mobile ? 170 : 230,
                    height: mobile ? 170 : 230,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFFFC107).withValues(alpha: 0.10),
                    ),
                  ),
                ),

                // ======================================================
                // BOTTOM LEFT GLOW
                // ======================================================
                Positioned(
                  bottom: -100,
                  left: -90,
                  child: Container(
                    width: mobile ? 190 : 250,
                    height: mobile ? 190 : 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF6C63FF).withValues(alpha: 0.12),
                    ),
                  ),
                ),

                // ======================================================
                // DECORATIVE BORDER
                // ======================================================
                Positioned.fill(
                  child: IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.12),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(radius),
                      ),
                    ),
                  ),
                ),

                // ======================================================
                // HERO CONTENT
                // ======================================================
                Center(
                  child: _HeroContent(
                    width: width,
                    mobile: mobile,
                    tablet: tablet,
                    desktop: desktop,
                  ),
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
// HERO CONTENT
// ============================================================================

class _HeroContent extends StatelessWidget {
  final double width;
  final bool mobile;
  final bool tablet;
  final bool desktop;

  const _HeroContent({
    required this.width,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final double contentWidth;

    if (mobile) {
      contentWidth = width * 0.88;
    } else if (tablet) {
      contentWidth = width * 0.72;
    } else {
      contentWidth = width * 0.62;
    }

    final double titleSize;

    if (mobile) {
      titleSize = 29;
    } else if (tablet) {
      titleSize = 39;
    } else {
      titleSize = 52;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: contentWidth),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: mobile ? 18 : 30,
          vertical: mobile ? 22 : 30,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.09),
          borderRadius: BorderRadius.circular(mobile ? 18 : 26),
          border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.20),
              blurRadius: 30,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ----------------------------------------------------------
            // SMALL TITLE
            // ----------------------------------------------------------
            Text(
              "PROUDLY PARTNERED WITH",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFFFC107),
                fontSize: mobile ? 10 : 13,
                fontWeight: FontWeight.w700,
                letterSpacing: mobile ? 1.5 : 2.3,
              ),
            ),

            const SizedBox(height: 10),

            // ----------------------------------------------------------
            // MAIN TITLE
            // ----------------------------------------------------------
            Text(
              "Brands That Trust Us",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: titleSize,
                fontWeight: FontWeight.w800,
                height: 1.05,
              ),
            ),

            const SizedBox(height: 14),

            // ----------------------------------------------------------
            // DESCRIPTION
            // ----------------------------------------------------------
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: mobile
                    ? 330
                    : tablet
                    ? 520
                    : 650,
              ),
              child: Text(
                "Building meaningful partnerships with ambitious "
                "brands through strategy, creativity and digital growth.",
                textAlign: TextAlign.center,
                maxLines: mobile ? 3 : 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.72),
                  fontSize: mobile ? 13 : 15,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ----------------------------------------------------------
            // BACK BUTTON
            // ----------------------------------------------------------
            _SafeBackButton(),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// SAFE BACK BUTTON
// ============================================================================

class _SafeBackButton extends StatelessWidget {
  const _SafeBackButton();

  @override
  Widget build(BuildContext context) {
    return CustomBackToHome(title: "Partners");
  }
}

// ============================================================================
// HERO FALLBACK
// ============================================================================

class _HeroFallbackBackground extends StatelessWidget {
  const _HeroFallbackBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF302B63), Color(0xFF211E4B), Color(0xFF15132F)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -100,
            right: -80,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF6C63FF),
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            left: -100,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFC107),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
