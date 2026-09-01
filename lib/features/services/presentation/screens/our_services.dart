import 'package:flutter/material.dart';
import 'package:hassanzamin/features/services/presentation/widgets/our_service_grid.dart';
import 'package:hassanzamin/features/services/provider/our_service_provider.dart';
import 'package:provider/provider.dart';

import 'package:hassanzamin/core/constants/app_colors.dart';
import 'package:hassanzamin/core/widgets/custom_appbar.dart';
import 'package:hassanzamin/features/footer/presentation/screens/footer_section.dart';
import 'package:hassanzamin/features/footer/presentation/screens/newsletter_section.dart';
import 'package:hassanzamin/routes/back_to_home.dart';

class OurServicesScreen extends StatelessWidget {
  const OurServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OurServiceProvider(),
      child: const _OurServicesView(),
    );
  }
}

class _OurServicesView extends StatelessWidget {
  const _OurServicesView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              customAppBar(context),

              _buildTopBar(context),

              SizedBox(height: 80),

              _buildSectionHeading(context),

              SizedBox(height: 45),

              OurServicesGrid(),

              SizedBox(height: 90),

              NewsletterSection(),

              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // HERO
  // ============================================================

  Widget _buildTopBar(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final bool mobile = width < 768;
        final bool tablet = width >= 768 && width < 1200;

        final double heroHeight = mobile
            ? 250
            : tablet
            ? 350
            : 400;

        final double horizontalMargin = mobile
            ? 15
            : tablet
            ? 25
            : 35;

        final double glassWidth = mobile
            ? width * .88
            : tablet
            ? width * .72
            : width * .62;

        final double titleSize = mobile
            ? 28
            : tablet
            ? 38
            : 52;

        return Container(
          height: heroHeight,
          margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(mobile ? 18 : 28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .25),
                blurRadius: 35,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // --------------------------------------------------
              // BACKGROUND
              // --------------------------------------------------

              Image.asset(
                'assets/images/aboutus.png',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),

              // --------------------------------------------------
              // DARK OVERLAY
              // --------------------------------------------------
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: .10),
                      Colors.black.withValues(alpha: .55),
                    ],
                  ),
                ),
              ),

              // --------------------------------------------------
              // DECORATIVE GLOW
              // --------------------------------------------------
              Positioned(
                top: -100,
                right: -80,
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.yellow.withValues(alpha: .08),
                  ),
                ),
              ),

              // --------------------------------------------------
              // GLASS CARD
              // --------------------------------------------------
              Center(
                child: Container(
                  width: glassWidth,
                  padding: EdgeInsets.symmetric(
                    horizontal: mobile ? 20 : 35,
                    vertical: mobile ? 20 : 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: .25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .20),
                        blurRadius: 30,
                        offset: const Offset(0, 15),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Services We Offer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: titleSize,
                          height: 1,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1.5,
                        ),
                      ),

                      SizedBox(height: mobile ? 15 : 22),

                      const CustomBackToHome(title: 'Our Services'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ============================================================
  // SECTION HEADING
  // ============================================================

  Widget _buildSectionHeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            'WHAT I DO',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.yellow,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 3,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            'Strategies Built For Growth',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.sizeOf(context).width < 700 ? 32 : 46,
              height: 1,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
            ),
          ),

          const SizedBox(height: 15),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              'Focused digital marketing solutions designed to build visibility, generate opportunities and create sustainable growth.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: .55),
                fontSize: 15,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
