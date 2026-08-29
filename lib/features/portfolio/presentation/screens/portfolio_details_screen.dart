import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hassanzamin/core/constants/app_colors.dart';
import 'package:hassanzamin/core/widgets/custom_appbar.dart';
import 'package:hassanzamin/features/footer/presentation/screens/footer_section.dart';
import 'package:hassanzamin/features/footer/presentation/screens/newsletter_section.dart';
import 'package:hassanzamin/features/partners/provider/partner_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final isHovered = context.watch<MouseRegionForPartnerProvider>().hovered;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1150;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(context),

            // ============================================================
            // HERO SECTION
            // ============================================================
            LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;

                final bool isMobile = width < 768;
                final bool isTablet = width >= 768 && width < 1200;
                final bool isDesktop = width >= 1200;

                final double heroHeight = isDesktop
                    ? 400
                    : isTablet
                    ? 350
                    : 250;

                final double glassWidth = isDesktop
                    ? width * .65
                    : isTablet
                    ? width * .70
                    : width * .70;

                final double glassPadding = isDesktop
                    ? 30
                    : isTablet
                    ? 16
                    : 10;

                final double titleSize = isDesktop
                    ? 50
                    : isTablet
                    ? 35
                    : 26;

                return Container(
                  margin: EdgeInsets.symmetric(horizontal: isMobile ? 15 : 30),
                  height: heroHeight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background Image
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/aboutus.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Glass Card
                      Center(
                        child: Container(
                          width: glassWidth,
                          padding: EdgeInsets.symmetric(
                            horizontal: glassPadding,
                            vertical: glassPadding,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: .25),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: .35),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                data.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: titleSize,
                                ),
                              ),

                              SizedBox(height: isMobile ? 15 : 25),

                              CustomBackToHome(title: portfolioModel.category),

                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 50),

            // ============================================================
            // CONTENT SECTION
            // ============================================================
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile
                    ? 24
                    : isTablet
                    ? 50
                    : 80,
                vertical: isMobile
                    ? 45
                    : isTablet
                    ? 65
                    : 85,
              ),
              child: isMobile
                  ? _buildMobile(context, isHovered)
                  : _buildDesktop(
                      context,
                      isTablet: isTablet,
                      isHovered: isHovered,
                    ),
            ),

            const SizedBox(height: 50),

            NewsletterSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DESKTOP
  // ============================================================

  Widget _buildDesktop(
    BuildContext context, {
    required bool isTablet,
    required bool isHovered,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 47,
          child: Padding(
            padding: EdgeInsets.only(right: isTablet ? 35 : 70),
            child: _buildContent(context, isTablet: isTablet),
          ),
        ),

        Expanded(
          flex: 53,
          child: _buildImage(context, isTablet: isTablet, isHovered: isHovered),
        ),
      ],
    );
  }

  // ============================================================
  // MOBILE
  // ============================================================

  Widget _buildMobile(BuildContext context, bool isHovered) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImage(context, isTablet: false, isHovered: isHovered),

        const SizedBox(height: 40),

        _buildContent(context, isTablet: false),
      ],
    );
  }

  // ============================================================
  // CONTENT
  // ============================================================

  Widget _buildContent(BuildContext context, {required bool isTablet}) {
    final width = MediaQuery.sizeOf(context).width;

    final double h1Size = width < 700
        ? 38
        : width < 1150
        ? 44
        : 45;

    final double h2Size = width < 700
        ? 22
        : width < 1150
        ? 25
        : 30;

    final double h3Size = width < 700 ? 14 : 18;

    final double bodySize = width < 700 ? 15 : 16.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildNavigation(),

        const SizedBox(height: 35),

        Text(
          data.brand,
          style: TextStyle(
            fontSize: h1Size * .62,
            height: 1,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.2,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          data.h1,
          style: TextStyle(
            fontSize: h1Size,
            height: .98,
            fontWeight: FontWeight.w800,
            letterSpacing: -2,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 28),

        Text(
          data.h2,
          style: TextStyle(
            fontSize: h2Size,
            height: 1.25,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 18),

        Text(
          data.h3,
          style: TextStyle(
            fontSize: h3Size,
            height: 1.3,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 25),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Text(
            data.body,
            style: TextStyle(
              fontSize: bodySize,
              height: 1.7,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),

        const SizedBox(height: 30),

        _buildSupportingInformation(),

        const SizedBox(height: 32),

        _buildCTA(context),

        const SizedBox(height: 38),

        _buildFooter(),
      ],
    );
  }

  // ============================================================
  // NAVIGATION
  // ============================================================

  Widget _buildNavigation() {
    return Wrap(
      spacing: 22,
      runSpacing: 10,
      children: data.navigation.map(_navItem).toList(),
    );
  }

  Widget _navItem(String text) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.1,
          color: Colors.grey,
        ),
      ),
    );
  }

  // ============================================================
  // SUPPORTING INFORMATION
  // ============================================================

  Widget _buildSupportingInformation() {
    return Wrap(
      spacing: 35,
      runSpacing: 22,
      children: [
        _infoItem(title: 'CLIENT', value: data.client),
        _infoItem(title: 'FOCUS', value: data.focus),
        _infoItem(title: 'ROLE', value: data.role),
        _infoItem(title: 'EXPERIENCE', value: data.experience),
      ],
    );
  }

  Widget _infoItem({required String title, required String value}) {
    return SizedBox(
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 7),

          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              height: 1.3,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CTA
  // ============================================================

  Widget _buildCTA(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Do NOT push "portfolioDetails" here because
          // this screen is already the portfolioDetails route.
          context.pop();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data.ctaText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),

              const SizedBox(width: 18),

              const Icon(
                Icons.arrow_forward_rounded,
                size: 18,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white, width: 1)),
      ),
      child: Text(
        data.footerText,
        style: const TextStyle(
          fontSize: 12,
          letterSpacing: .5,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  // ============================================================
  // IMAGE
  // ============================================================

  Widget _buildImage(
    BuildContext context, {
    required bool isTablet,
    required bool isHovered,
  }) {
    final width = MediaQuery.sizeOf(context).width;

    final double imageHeight = width < 700
        ? width * .62
        : width < 1150
        ? 500
        : 650;

    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        context.read<MouseRegionForPartnerProvider>().setHover(true);
      },

      onExit: (_) {
        context.read<MouseRegionForPartnerProvider>().setHover(false);
      },

      child: AnimatedScale(
        scale: isHovered ? 1.012 : 1.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        child: Container(
          width: double.infinity,
          height: imageHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: .12),
                blurRadius: 25,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            data.image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            errorBuilder: (context, error, stackTrace) {
              return const ColoredBox(
                color: Color(0xffeeeeee),
                child: Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
