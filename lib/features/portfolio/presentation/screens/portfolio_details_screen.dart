import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:hassanzamin/core/widgets/custom_appbar.dart';
import 'package:hassanzamin/features/footer/presentation/screens/footer_section.dart';
import 'package:hassanzamin/features/footer/presentation/screens/newsletter_section.dart';
import 'package:hassanzamin/routes/back_to_home.dart';
import 'package:provider/provider.dart';

import '../../model/portfolio_model.dart';

class PortfolioDetailsScreen extends StatelessWidget {
  final PortfoliosModel portfolioModel;
  final int index;

  const PortfolioDetailsScreen({
    super.key,
    required this.portfolioModel,
    required this.index,
  });

  PortfoliosModel get data => portfolioModel;

  // ===========================================================================
  // PREMIUM COLOR SYSTEM
  // ===========================================================================

  static const Color _background = Color(0xFF19183B);
  static const Color _card = Color(0xFF23214C);
  static const Color _cardLight = Color(0xFF292653);

  static const Color _primaryText = Color(0xFFF8F5EE);
  static const Color _secondaryText = Color(0xFFB8B5C9);
  static const Color _mutedText = Color(0xFF8F8CA8);

  static const Color _accent = Color(0xFFFFB800);

  static const Color _black = Color(0xFF0D0D18);

  // ===========================================================================
  // BUILD
  // ===========================================================================

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1150;
    final bool isDesktop = width >= 1150;

    final bool isHovered = context.select<MouseRegionProvider, bool>(
      (provider) => provider.isHovered(index),
    );

    return Scaffold(
      backgroundColor: _background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            customAppBar(context),

            _buildHeroSection(
              context,
              isMobile: isMobile,
              isTablet: isTablet,
              isDesktop: isDesktop,
            ),

            SizedBox(height: isMobile ? 45 : 80),

            _buildMainContent(
              context,
              isMobile: isMobile,
              isTablet: isTablet,
              isHovered: isHovered,
            ),

            SizedBox(height: isMobile ? 60 : 100),

            const NewsletterSection(),
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // HERO SECTION
  // ===========================================================================

  Widget _buildHeroSection(
    BuildContext context, {
    required bool isMobile,
    required bool isTablet,
    required bool isDesktop,
  }) {
    final width = MediaQuery.sizeOf(context).width;

    final double heroHeight = isMobile
        ? 225
        : isTablet
        ? 315
        : 390;

    final double horizontalMargin = isMobile
        ? 14
        : isTablet
        ? 25
        : 40;

    final double cardWidth = isMobile
        ? width * .90
        : isTablet
        ? width * .72
        : width * .62;

    final double titleSize = isMobile
        ? 28
        : isTablet
        ? 40
        : 54;

    return Container(
      height: heroHeight,
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isMobile ? 18 : 28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .28),
            blurRadius: 40,
            offset: const Offset(0, 22),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // -------------------------------------------------------------------
          // BACKGROUND IMAGE
          // -------------------------------------------------------------------

          Image.asset(
            'assets/images/aboutus.png',
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),

          // -------------------------------------------------------------------
          // CINEMATIC COLOR OVERLAY
          // -------------------------------------------------------------------
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _background.withValues(alpha: .30),
                  _background.withValues(alpha: .48),
                  _black.withValues(alpha: .68),
                ],
              ),
            ),
          ),

          // -------------------------------------------------------------------
          // GOLDEN LIGHT
          // -------------------------------------------------------------------
          Positioned(
            top: -120,
            right: -80,
            child: _glow(size: 270, color: _accent, opacity: .10),
          ),

          Positioned(
            bottom: -150,
            left: -100,
            child: _glow(
              size: 300,
              color: const Color(0xFF6B5CFF),
              opacity: .08,
            ),
          ),

          // -------------------------------------------------------------------
          // GLASS CARD
          // -------------------------------------------------------------------
          Center(
            child: Container(
              width: cardWidth,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 38,
                vertical: isMobile ? 20 : 30,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withValues(alpha: .15),
                    Colors.white.withValues(alpha: .07),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withValues(alpha: .20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .18),
                    blurRadius: 35,
                    offset: const Offset(0, 18),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Small accent line
                  Container(
                    width: isMobile ? 35 : 48,
                    height: 3,
                    decoration: BoxDecoration(
                      color: _accent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: _accent.withValues(alpha: .45),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    data.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: _primaryText,
                      fontSize: titleSize,
                      height: .98,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1.8,
                    ),
                  ),

                  SizedBox(height: isMobile ? 16 : 22),

                  CustomBackToHome(title: data.category),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _glow({
    required double size,
    required Color color,
    required double opacity,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: opacity),
      ),
    );
  }

  // ===========================================================================
  // MAIN CONTENT
  // ===========================================================================

  Widget _buildMainContent(
    BuildContext context, {
    required bool isMobile,
    required bool isTablet,
    required bool isHovered,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? 20
            : isTablet
            ? 45
            : 70,
      ),
      child: isMobile
          ? _buildMobileLayout(context, isHovered: isHovered)
          : _buildDesktopLayout(
              context,
              isTablet: isTablet,
              isHovered: isHovered,
            ),
    );
  }

  // ===========================================================================
  // DESKTOP / TABLET
  // ===========================================================================

  Widget _buildDesktopLayout(
    BuildContext context, {
    required bool isTablet,
    required bool isHovered,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 48,
          child: Padding(
            padding: EdgeInsets.only(right: isTablet ? 35 : 65),
            child: _buildContent(context, isTablet: isTablet),
          ),
        ),

        Expanded(
          flex: 52,
          child: _buildImage(context, isTablet: isTablet, isHovered: isHovered),
        ),
      ],
    );
  }

  // ===========================================================================
  // MOBILE
  // ===========================================================================

  Widget _buildMobileLayout(BuildContext context, {required bool isHovered}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImage(context, isTablet: false, isHovered: isHovered),

        const SizedBox(height: 42),

        _buildContent(context, isTablet: false),
      ],
    );
  }

  // ===========================================================================
  // CONTENT
  // ===========================================================================

  Widget _buildContent(BuildContext context, {required bool isTablet}) {
    final width = MediaQuery.sizeOf(context).width;

    final bool mobile = width < 700;

    final double brandSize = mobile
        ? 20
        : isTablet
        ? 25
        : 30;

    final double titleSize = mobile
        ? 38
        : isTablet
        ? 46
        : 54;

    final double subtitleSize = mobile
        ? 21
        : isTablet
        ? 25
        : 30;

    final double bodySize = mobile
        ? 15
        : isTablet
        ? 16
        : 17;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------------------------------------------------------------------
        // NAVIGATION
        // ---------------------------------------------------------------------

        _buildNavigation(),

        SizedBox(height: mobile ? 27 : 34),

        // ---------------------------------------------------------------------
        // BRAND
        // ---------------------------------------------------------------------
        Text(
          data.brand,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: _primaryText,
            fontSize: brandSize,
            height: 1.15,
            fontWeight: FontWeight.w300,
            letterSpacing: -.5,
          ),
        ),

        const SizedBox(height: 6),

        // ---------------------------------------------------------------------
        // MAIN HEADING
        // ---------------------------------------------------------------------
        Text(
          data.h1,
          style: TextStyle(
            color: _primaryText,
            fontSize: titleSize,
            height: .95,
            fontWeight: FontWeight.w800,
            letterSpacing: -2.4,
          ),
        ),

        SizedBox(height: mobile ? 25 : 30),

        // ---------------------------------------------------------------------
        // SECONDARY HEADING
        // ---------------------------------------------------------------------
        Text(
          data.h2,
          style: TextStyle(
            color: _secondaryText,
            fontSize: subtitleSize,
            height: 1.25,
            fontWeight: FontWeight.w600,
            letterSpacing: -.4,
          ),
        ),

        const SizedBox(height: 21),

        // ---------------------------------------------------------------------
        // CATEGORY / ROLE
        // ---------------------------------------------------------------------
        _buildCategoryLine(isMobile: mobile),

        const SizedBox(height: 27),

        // ---------------------------------------------------------------------
        // DESCRIPTION
        // ---------------------------------------------------------------------
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            data.body,
            style: TextStyle(
              color: _secondaryText,
              fontSize: bodySize,
              height: 1.78,
              fontWeight: FontWeight.w400,
              letterSpacing: .05,
            ),
          ),
        ),

        const SizedBox(height: 36),

        // ---------------------------------------------------------------------
        // INFORMATION
        // ---------------------------------------------------------------------
        _buildInformationCard(isMobile: mobile),

        const SizedBox(height: 34),

        // ---------------------------------------------------------------------
        // CTA
        // ---------------------------------------------------------------------
        _buildCTA(context),

        const SizedBox(height: 40),

        // ---------------------------------------------------------------------
        // FOOTER LINE
        // ---------------------------------------------------------------------
        _buildFooter(),
      ],
    );
  }

  // ===========================================================================
  // CATEGORY LINE
  // ===========================================================================

  Widget _buildCategoryLine({required bool isMobile}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 3),
          width: 4,
          height: 24,
          decoration: BoxDecoration(
            color: _accent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: _accent.withValues(alpha: .35), blurRadius: 10),
            ],
          ),
        ),

        const SizedBox(width: 13),

        Expanded(
          child: Text(
            data.h3,
            style: TextStyle(
              color: _secondaryText,
              fontSize: isMobile ? 13 : 15,
              height: 1.45,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.05,
            ),
          ),
        ),
      ],
    );
  }

  // ===========================================================================
  // NAVIGATION
  // ===========================================================================

  Widget _buildNavigation() {
    return Wrap(
      spacing: 22,
      runSpacing: 13,
      children: data.navigation.map(_navItem).toList(),
    );
  }

  Widget _navItem(String text) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: _accent.withValues(alpha: .55), width: 1),
          ),
        ),
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: _mutedText,
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.25,
          ),
        ),
      ),
    );
  }

  // ===========================================================================
  // INFORMATION CARD
  // ===========================================================================

  Widget _buildInformationCard({required bool isMobile}) {
    final items = [
      _InformationData(title: 'CLIENT', value: data.client),
      _InformationData(title: 'FOCUS', value: data.focus),
      _InformationData(title: 'ROLE', value: data.role),
      _InformationData(title: 'EXPERIENCE', value: data.experience),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 19 : 25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _cardLight.withValues(alpha: .70),
            _card.withValues(alpha: .55),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: .10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .12),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Wrap(
        spacing: isMobile ? 20 : 32,
        runSpacing: 26,
        children: items
            .map(
              (item) => _infoItem(
                title: item.title,
                value: item.value,
                isMobile: isMobile,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _infoItem({
    required String title,
    required String value,
    required bool isMobile,
  }) {
    return SizedBox(
      width: isMobile ? 125 : 145,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: _accent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _accent.withValues(alpha: .45),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              Text(
                title,
                style: const TextStyle(
                  color: _mutedText,
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.35,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Value
          Text(
            value,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: _primaryText.withValues(alpha: .88),
              fontSize: isMobile ? 12 : 13,
              height: 1.38,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // CTA
  // ===========================================================================

  Widget _buildCTA(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.pop(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
          decoration: BoxDecoration(
            color: _black,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white.withValues(alpha: .08)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .25),
                blurRadius: 22,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data.ctaText.toUpperCase(),
                style: const TextStyle(
                  color: _primaryText,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.15,
                ),
              ),

              const SizedBox(width: 17),

              Container(
                width: 31,
                height: 31,
                decoration: BoxDecoration(
                  color: _accent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _accent.withValues(alpha: .25),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 17,
                  color: _black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===========================================================================
  // FOOTER
  // ===========================================================================

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: .13), width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: 20,
            height: 2,
            color: _accent,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              data.footerText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: _mutedText,
                fontSize: 11,
                height: 1.45,
                letterSpacing: .5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // IMAGE
  // ===========================================================================

  Widget _buildImage(
    BuildContext context, {
    required bool isTablet,
    required bool isHovered,
  }) {
    final width = MediaQuery.sizeOf(context).width;

    final double imageHeight = width < 700
        ? width * .62
        : isTablet
        ? 470
        : 620;

    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        context.read<MouseRegionProvider>().setHover(index);
      },

      onExit: (_) {
        context.read<MouseRegionProvider>().clearHover(index);
      },

      child: AnimatedScale(
        scale: isHovered ? 1.015 : 1.0,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
        child: Container(
          width: double.infinity,
          height: imageHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),

            border: Border.all(
              color: isHovered
                  ? _accent.withValues(alpha: .48)
                  : Colors.white.withValues(alpha: .10),
              width: 1,
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isHovered ? .38 : .24),
                blurRadius: isHovered ? 42 : 30,
                offset: const Offset(0, 18),
              ),

              BoxShadow(
                color: _accent.withValues(alpha: isHovered ? .08 : .025),
                blurRadius: 35,
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,

          child: Stack(
            fit: StackFit.expand,
            children: [
              // -----------------------------------------------------------------
              // IMAGE
              // -----------------------------------------------------------------

              Image.asset(
                data.image,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: _card,
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 50,
                        color: _mutedText,
                      ),
                    ),
                  );
                },
              ),

              // -----------------------------------------------------------------
              // IMAGE GRADIENT
              // -----------------------------------------------------------------
              AnimatedOpacity(
                opacity: isHovered ? .32 : .12,
                duration: const Duration(milliseconds: 400),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        _background.withValues(alpha: .72),
                      ],
                    ),
                  ),
                ),
              ),

              // -----------------------------------------------------------------
              // TOP ACCENT
              // -----------------------------------------------------------------
              Positioned(
                top: 18,
                left: 18,
                child: AnimatedOpacity(
                  opacity: isHovered ? 1 : .75,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: _black.withValues(alpha: .68),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: .12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: _accent,
                            shape: BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 7),

                        Text(
                          data.category.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: _primaryText,
                            fontSize: 8,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // -----------------------------------------------------------------
              // HOVER PROJECT LABEL
              // -----------------------------------------------------------------
              Positioned(
                right: 20,
                bottom: 20,
                child: AnimatedOpacity(
                  opacity: isHovered ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: _black.withValues(alpha: .82),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: _accent.withValues(alpha: .35)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .25),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: _accent,
                            shape: BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 8),

                        const Text(
                          'VIEW PROJECT',
                          style: TextStyle(
                            color: _primaryText,
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.15,
                          ),
                        ),

                        const SizedBox(width: 7),

                        const Icon(
                          Icons.arrow_outward_rounded,
                          size: 13,
                          color: _accent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // -----------------------------------------------------------------
              // HOVER BORDER
              // -----------------------------------------------------------------
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: isHovered
                        ? _accent.withValues(alpha: .55)
                        : Colors.transparent,
                    width: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// PRIVATE INFORMATION MODEL
// ============================================================================

class _InformationData {
  final String title;
  final String value;

  const _InformationData({required this.title, required this.value});
}
