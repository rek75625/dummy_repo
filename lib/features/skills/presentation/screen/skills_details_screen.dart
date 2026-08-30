import 'package:flutter/material.dart';
import 'package:hassanzamin/core/widgets/custom_appbar.dart';
import 'package:hassanzamin/features/footer/presentation/screens/footer_section.dart';
import 'package:hassanzamin/features/footer/presentation/screens/newsletter_section.dart';
import 'package:hassanzamin/features/skills/model/skill_model.dart';
import 'package:hassanzamin/features/skills/provider/skills_data.dart';
import 'package:hassanzamin/routes/back_to_home.dart';

class SkillsDetailsScreen extends StatelessWidget {
  final int index;

  const SkillsDetailsScreen({super.key, required this.index});

  // ============================================================
  // COLORS
  // ============================================================

  static const Color background = Color(0xff1C1A45);
  static const Color card = Color(0xff292653);
  static const Color yellow = Color(0xffffb800);
  static const Color softWhite = Color(0xfff5f4fb);
  static const Color lightCard = Color(0xffebeaf3);

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    // Never allow an invalid index to crash the screen.
    final safeIndex = index.clamp(0, skills.length - 1);
    final skill = skills[safeIndex];

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            final bool mobile = width < 700;
            final bool tablet = width >= 700 && width < 1100;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  customAppBar(context),
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
                        margin: EdgeInsets.symmetric(
                          horizontal: isMobile ? 15 : 30,
                        ),
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
                                      "Digital Growth Experts",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: titleSize,
                                      ),
                                    ),
                                    SizedBox(height: isMobile ? 15 : 25),
                                    CustomBackToHome(title: skill.title),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      mobile
                          ? 20
                          : tablet
                          ? 40
                          : 70,
                      mobile
                          ? 25
                          : tablet
                          ? 40
                          : 55,
                      mobile
                          ? 20
                          : tablet
                          ? 40
                          : 70,
                      mobile
                          ? 60
                          : tablet
                          ? 80
                          : 100,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1400),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _hero(
                              context,
                              skill,
                              mobile: mobile,
                              tablet: tablet,
                            ),

                            SizedBox(
                              height: mobile
                                  ? 45
                                  : tablet
                                  ? 55
                                  : 70,
                            ),

                            _overviewSection(context, skill, mobile: mobile),

                            SizedBox(
                              height: mobile
                                  ? 45
                                  : tablet
                                  ? 55
                                  : 70,
                            ),

                            _metricsSection(context, skill),

                            SizedBox(
                              height: mobile
                                  ? 45
                                  : tablet
                                  ? 55
                                  : 70,
                            ),

                            _processSection(context, skill),

                            SizedBox(
                              height: mobile
                                  ? 45
                                  : tablet
                                  ? 55
                                  : 70,
                            ),

                            _resultSection(context, skill, mobile: mobile),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  NewsletterSection(),
                  FooterSection(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // HERO
  // ============================================================

  Widget _hero(
    BuildContext context,
    SkillPageData skill, {
    required bool mobile,
    required bool tablet,
  }) {
    final image = _skillImage(skill, mobile: mobile);

    final content = _heroContent(context, skill, mobile: mobile);

    if (mobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [image, const SizedBox(height: 35), content],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: tablet ? 48 : 47, child: image),
        SizedBox(width: tablet ? 35 : 65),
        Expanded(flex: tablet ? 52 : 53, child: content),
      ],
    );
  }

  Widget _skillImage(SkillPageData skill, {required bool mobile}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(mobile ? 22 : 30),
      child: AspectRatio(
        aspectRatio: mobile ? 1.15 : 1.12,
        child: Image.asset(
          skill.image,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: card,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(skill.icon, color: yellow, size: mobile ? 55 : 80),
                  const SizedBox(height: 15),
                  Text(
                    skill.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: .65),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _heroContent(
    BuildContext context,
    SkillPageData skill, {
    required bool mobile,
  }) {
    final width = MediaQuery.sizeOf(context).width;

    final titleSize = width < 700
        ? 34.0
        : width < 1100
        ? 43.0
        : 55.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: mobile ? 64 : 72,
          height: mobile ? 64 : 72,
          decoration: BoxDecoration(
            color: yellow,
            borderRadius: BorderRadius.circular(mobile ? 18 : 20),
          ),
          child: Icon(skill.icon, color: background, size: mobile ? 30 : 34),
        ),

        const SizedBox(height: 25),

        Text(
          skill.title.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: titleSize,
            fontWeight: FontWeight.w900,
            height: 1.04,
            letterSpacing: -1.5,
          ),
        ),

        const SizedBox(height: 18),

        Text(
          skill.subtitle,
          style: TextStyle(
            color: yellow,
            fontSize: mobile ? 18 : 23,
            fontWeight: FontWeight.w700,
            height: 1.25,
          ),
        ),

        const SizedBox(height: 24),

        Text(
          skill.description,
          style: TextStyle(
            color: Colors.white.withValues(alpha: .72),
            fontSize: mobile ? 15 : 17,
            height: 1.7,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // OVERVIEW
  // ============================================================

  Widget _overviewSection(
    BuildContext context,
    SkillPageData skill, {
    required bool mobile,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(mobile ? 22 : 35),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(mobile ? 22 : 28),
        border: Border.all(color: Colors.white.withValues(alpha: .08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _sectionHeading(eyebrow: 'OVERVIEW', title: 'What I Do'),

          const SizedBox(height: 28),

          LayoutBuilder(
            builder: (context, constraints) {
              final bool twoColumns = constraints.maxWidth >= 700;

              return Wrap(
                spacing: 14,
                runSpacing: 14,
                children: skill.services.map((service) {
                  final width = twoColumns
                      ? (constraints.maxWidth - 14) / 2
                      : constraints.maxWidth;

                  return SizedBox(width: width, child: _serviceItem(service));
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _serviceItem(String text) {
    return Container(
      constraints: const BoxConstraints(minHeight: 62),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_rounded, color: yellow, size: 21),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // METRICS
  // ============================================================

  Widget _metricsSection(BuildContext context, SkillPageData skill) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _sectionHeading(eyebrow: 'EXPERTISE', title: 'Built Around Results'),

        const SizedBox(height: 28),

        LayoutBuilder(
          builder: (context, constraints) {
            final double gap = constraints.maxWidth < 600 ? 12 : 18;

            final int columns = constraints.maxWidth >= 900
                ? 3
                : constraints.maxWidth >= 560
                ? 2
                : 1;

            final double itemWidth = columns == 1
                ? constraints.maxWidth
                : (constraints.maxWidth - gap * (columns - 1)) / columns;

            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: skill.metrics.map((metric) {
                return SizedBox(
                  width: itemWidth,
                  child: _metricCard(metric.$1, metric.$2),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _metricCard(String value, String label) {
    return Container(
      constraints: const BoxConstraints(minHeight: 155),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white.withValues(alpha: .07)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: yellow,
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: .65),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PROCESS
  // ============================================================

  Widget _processSection(BuildContext context, SkillPageData skill) {
    final width = MediaQuery.sizeOf(context).width;
    final mobile = width < 700;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(mobile ? 22 : 35),
      decoration: BoxDecoration(
        color: softWhite,
        borderRadius: BorderRadius.circular(mobile ? 22 : 30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'HOW I WORK',
            style: TextStyle(
              color: yellow,
              fontSize: 13,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'From Strategy To Execution',
            style: TextStyle(
              color: background,
              fontSize: mobile ? 28 : 38,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          ),

          const SizedBox(height: 28),

          LayoutBuilder(
            builder: (context, constraints) {
              final bool desktop = constraints.maxWidth >= 1000;

              if (desktop) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(skill.process.length, (index) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: index == skill.process.length - 1 ? 0 : 10,
                        ),
                        child: _processItem(index + 1, skill.process[index]),
                      ),
                    );
                  }),
                );
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(skill.process.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index == skill.process.length - 1 ? 0 : 12,
                    ),
                    child: _processItem(index + 1, skill.process[index]),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _processItem(int number, String title) {
    return Container(
      constraints: const BoxConstraints(minHeight: 85),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: lightCard,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: yellow,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              number.toString().padLeft(2, '0'),
              style: const TextStyle(
                color: background,
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: background,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // RESULT
  // ============================================================

  Widget _resultSection(
    BuildContext context,
    SkillPageData skill, {
    required bool mobile,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(mobile ? 25 : 40),
      decoration: BoxDecoration(
        color: yellow,
        borderRadius: BorderRadius.circular(mobile ? 22 : 30),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool stack = constraints.maxWidth < 650;

          final text = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'THE RESULT',
                style: TextStyle(
                  color: background,
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                skill.resultTitle,
                style: TextStyle(
                  color: background,
                  fontSize: mobile ? 28 : 38,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                skill.resultDescription,
                style: TextStyle(
                  color: background.withValues(alpha: .75),
                  fontSize: 15,
                  height: 1.6,
                ),
              ),
            ],
          );

          if (stack) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [text, const SizedBox(height: 25), _resultIcon(skill)],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: text),
              const SizedBox(width: 40),
              _resultIcon(skill),
            ],
          );
        },
      ),
    );
  }

  Widget _resultIcon(SkillPageData skill) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Icon(skill.icon, color: yellow, size: 40),
    );
  }

  // ============================================================
  // SECTION HEADING
  // ============================================================

  Widget _sectionHeading({required String eyebrow, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          eyebrow,
          style: const TextStyle(
            color: yellow,
            fontSize: 13,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.5,
          ),
        ),

        const SizedBox(height: 9),

        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 34,
            fontWeight: FontWeight.w900,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}
