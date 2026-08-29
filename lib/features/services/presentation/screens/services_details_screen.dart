import 'package:flutter/material.dart';
import 'package:hassanzamin/core/widgets/custom_appbar.dart';
import 'package:hassanzamin/features/footer/presentation/screens/footer_section.dart';
import 'package:hassanzamin/features/footer/presentation/screens/newsletter_section.dart';
import 'package:hassanzamin/features/services/provider/details_service_model.dart';
import 'package:hassanzamin/features/services/service_model.dart';
import 'package:hassanzamin/routes/back_to_home.dart';
import 'package:provider/provider.dart';

class ServicesDetailScreen extends StatefulWidget {
  final int initialIndex;

  const ServicesDetailScreen({super.key, this.initialIndex = 0});

  @override
  State<ServicesDetailScreen> createState() => _ServicesDetailScreenState();
}

class _ServicesDetailScreenState extends State<ServicesDetailScreen> {
  ServiceDetailModule _getSelectedService(BuildContext context) {
    final provider = context.watch<SelectServiceProvider>();
    final index = provider.selectedIndex.clamp(
      0,
      ServiceDetailData.services.length - 1,
    );
    return ServiceDetailData.services[index];
  }

  @override
  Widget build(BuildContext context) {
    final selectedService = _getSelectedService(context);
    return Scaffold(
      backgroundColor: const Color(0xff242052),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              customAppBar(context),
              _buildTopBar(context, selectedService),

              _buildHero(context, selectedService),

              _buildModuleSection(context, selectedService),

              _buildCompleteDetails(context, selectedService),

              _buildFooter(),
              SizedBox(height: 50),
              NewsletterSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // TOP BAR
  // ============================================================

  Widget _buildTopBar(
    BuildContext context,
    ServiceDetailModule selectedService,
  ) {
    return LayoutBuilder(
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
              /// Background Image
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/aboutus.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /// Glass Card
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
                      /// Title
                      Text(
                        "Helping Businesses Grow Faster",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: titleSize,
                        ),
                      ),
                      SizedBox(height: isMobile ? 15 : 25),
                      CustomBackToHome(
                        title: ServiceDetailData
                            .services[widget.initialIndex]
                            .title,
                      ),
                      SizedBox(height: 20),
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
  // HERO
  // ============================================================

  Widget _buildHero(BuildContext context, ServiceDetailModule selectedService) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 35, 24, 65),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool mobile = constraints.maxWidth < 760;

          if (mobile) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeroImage(context, selectedService),

                const SizedBox(height: 28),

                _buildHeroContent(context, selectedService),
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 48,
                child: _buildHeroImage(context, selectedService),
              ),

              const SizedBox(width: 55),

              Expanded(
                flex: 52,
                child: _buildHeroContent(context, selectedService),
              ),
            ],
          );
        },
      ),
    );
  }

  // ============================================================
  // HERO IMAGE
  // ============================================================

  Widget _buildHeroImage(
    BuildContext context,
    ServiceDetailModule selectedService,
  ) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 450),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,

      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: .96, end: 1).animate(animation),
            child: child,
          ),
        );
      },

      child: ClipRRect(
        key: ValueKey(selectedService.image),
        borderRadius: BorderRadius.circular(30),
        child: AspectRatio(
          aspectRatio: 1.05,
          child: Image.asset(selectedService.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  // ============================================================
  // HERO CONTENT
  // ============================================================

  Widget _buildHeroContent(
    BuildContext context,
    ServiceDetailModule selectedService,
  ) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),

      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(.04, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },

      child: Column(
        key: ValueKey(selectedService.number),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNumber(context, selectedService),

          const SizedBox(height: 18),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: const Color(0xffffd238),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Icon(
                  selectedService.icon,
                  color: const Color(0xff242052),
                  size: 28,
                ),
              ),

              const SizedBox(width: 17),

              Expanded(
                child: Text(
                  selectedService.title.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 31,
                    fontWeight: FontWeight.w800,
                    height: 1.08,
                    letterSpacing: .3,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          Text(
            selectedService.description,
            style: const TextStyle(
              color: Color(0xffc2bfd5),
              fontSize: 16,
              height: 1.65,
            ),
          ),

          const SizedBox(height: 22),

          _buildHeroPoints(context, selectedService),

          const SizedBox(height: 30),

          _buildHeroMetrics(context, selectedService),
        ],
      ),
    );
  }

  Widget _buildNumber(
    BuildContext context,
    ServiceDetailModule selectedService,
  ) {
    return Text(
      selectedService.number,
      style: const TextStyle(
        color: Color(0xffffc928),
        fontSize: 18,
        fontWeight: FontWeight.w800,
        letterSpacing: 2,
      ),
    );
  }

  // ============================================================
  // HERO POINTS
  // ============================================================

  Widget _buildHeroPoints(
    BuildContext context,
    ServiceDetailModule selectedService,
  ) {
    return Wrap(
      spacing: 9,
      runSpacing: 9,
      children: selectedService.points.map((point) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
          decoration: BoxDecoration(
            color: const Color(0xff363262),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white.withValues(alpha: .08)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_rounded,
                color: Color(0xffffc928),
                size: 15,
              ),

              const SizedBox(width: 6),

              Text(
                point,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ============================================================
  // HERO METRICS
  // ============================================================

  Widget _buildHeroMetrics(
    BuildContext context,
    ServiceDetailModule selectedService,
  ) {
    return Row(
      children: [
        _HeroMetric(
          value: selectedService.metricOne,
          label: selectedService.metricOneLabel,
        ),

        const SizedBox(width: 35),

        _HeroMetric(
          value: selectedService.metricTwo,
          label: selectedService.metricTwoLabel,
        ),
      ],
    );
  }

  // ============================================================
  // MODULES
  // ============================================================

  Widget _buildModuleSection(
    BuildContext context,
    ServiceDetailModule selectedService,
  ) {
    return Container(
      width: double.infinity,
      color: const Color(0xff1c1944),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionLabel('EXPLORE SERVICES'),

          const SizedBox(height: 12),

          const Text(
            'Choose a service',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 35),

          LayoutBuilder(
            builder: (context, constraints) {
              final bool mobile = constraints.maxWidth < 700;

              return Column(
                children: List.generate(ServiceDetailData.services.length, (
                  index,
                ) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildModuleCard(
                      ServiceDetailData.services[index],
                      index,
                      mobile,
                      context,
                      selectedService,
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard(
    ServiceDetailModule service,
    int index,
    bool mobile,
    BuildContext context,
    ServiceDetailModule selectedService,
  ) {
    final selectedIndex = context.watch<SelectServiceProvider>().selectedIndex;

    final bool selected = index == selectedIndex;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.read<SelectServiceProvider>().selectService(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: mobile ? 18 : 25,
            vertical: selected ? 22 : 18,
          ),
          decoration: BoxDecoration(
            color: selected ? const Color(0xffffb800) : const Color(0xff2b2856),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected
                  ? const Color(0xffffb800)
                  : Colors.white.withValues(alpha: .12),
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: const Color(0xffffb800).withValues(alpha: .18),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              Text(
                service.number,
                style: TextStyle(
                  color: selected ? const Color(0xff242052) : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(width: 18),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: selected
                            ? const Color(0xff242052)
                            : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    if (selected) ...[
                      const SizedBox(height: 9),

                      Text(
                        service.shortDescription,
                        maxLines: mobile ? 3 : 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xff302b50),
                          fontSize: 12,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(width: 15),

              AnimatedRotation(
                duration: const Duration(milliseconds: 300),
                turns: selected ? .25 : 0,
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: selected ? const Color(0xff242052) : Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // COMPLETE DETAILS
  // ============================================================

  Widget _buildCompleteDetails(
    BuildContext context,
    ServiceDetailModule selectedService,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 75, 24, 75),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),

        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },

        child: _buildDetailsContent(
          context,
          selectedService,
          key: ValueKey(selectedService.number),
        ),
      ),
    );
  }

  Widget _buildDetailsContent(
    BuildContext context,
    ServiceDetailModule selectedService, {
    required Key key,
  }) {
    return Container(
      key: key,
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 1250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionLabel('SERVICE DETAILS'),

          const SizedBox(height: 14),

          Text(
            selectedService.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w800,
              height: 1.1,
            ),
          ),

          const SizedBox(height: 45),

          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 750) {
                return Column(
                  children: [
                    _detailBox(
                      title: 'OVERVIEW',
                      content: selectedService.overview,
                    ),

                    const SizedBox(height: 18),

                    _detailBox(
                      title: 'APPROACH',
                      content: selectedService.approach,
                    ),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _detailBox(
                      title: 'OVERVIEW',
                      content: selectedService.overview,
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: _detailBox(
                      title: 'APPROACH',
                      content: selectedService.approach,
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 22),

          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 750) {
                return Column(
                  children: [
                    _capabilityBox(context, selectedService),
                    const SizedBox(height: 18),
                    _processBox(context, selectedService),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _capabilityBox(context, selectedService)),

                  const SizedBox(width: 20),

                  Expanded(child: _processBox(context, selectedService)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DETAIL BOX
  // ============================================================

  Widget _detailBox({required String title, required String content}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xff2c2958),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: .09)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _detailTitle(title),

          const SizedBox(height: 18),

          Text(
            content,
            style: const TextStyle(
              color: Color(0xffc4c1d4),
              fontSize: 15,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CAPABILITIES
  // ============================================================

  Widget _capabilityBox(
    BuildContext context,
    ServiceDetailModule selectedService,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xfff7f7f8),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'KEY CAPABILITIES',
            style: TextStyle(
              color: Color(0xff242052),
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 20),

          ...selectedService.capabilities.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 13),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    color: Color(0xffffc928),
                    size: 18,
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Color(0xff36315c),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PROCESS
  // ============================================================

  Widget _processBox(
    BuildContext context,
    ServiceDetailModule selectedService,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xffffc928),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MY PROCESS',
            style: TextStyle(
              color: Color(0xff242052),
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 20),

          ...List.generate(selectedService.process.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 13),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 27,
                    height: 27,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xff242052),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        selectedService.process[index],
                        style: const TextStyle(
                          color: Color(0xff242052),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // ============================================================
  // LABELS
  // ============================================================

  Widget _sectionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xffffc928),
        fontSize: 13,
        fontWeight: FontWeight.w800,
        letterSpacing: 2,
      ),
    );
  }

  Widget _detailTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xffffc928),
        fontSize: 13,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.5,
      ),
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      color: const Color(0xff1c1944),
      child: const Center(
        child: Text(
          'Hassan Zamin  •  Digital Growth  •  Business Transformation',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffaaa7c2),
            fontSize: 13,
            letterSpacing: .5,
          ),
        ),
      ),
    );
  }
}

// ================================================================
// HERO METRIC
// ================================================================

class _HeroMetric extends StatelessWidget {
  final String value;
  final String label;

  const _HeroMetric({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          label,
          style: const TextStyle(
            color: Color(0xffaaa7c2),
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
