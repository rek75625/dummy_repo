import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:hassanzamin/features/about/provider/about_provider.dart';

import 'package:hassanzamin/repositories/responsive.dart';
import 'package:provider/provider.dart';

class AboutWidget extends StatelessWidget {
  final bool isDetails;

  const AboutWidget({super.key, required this.isDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: _horizontalPadding(context),
        vertical: 70,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1250),
          child: AboutNewsContent(isDetails: isDetails),
        ),
      ),
    );
  }

  double _horizontalPadding(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return 70;
    }

    if (Responsive.isTablet(context)) {
      return 40;
    }

    return 20;
  }
}

///=============================
///   About News Content
///============================

class AboutNewsContent extends StatelessWidget {
  final bool isDetails;

  const AboutNewsContent({super.key, required this.isDetails});

  static const Color background = Color(0xff211E4F);
  static const Color cardColor = Color(0xff2D295C);
  static const Color yellow = Color(0xffFFB900);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AboutProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopsLabel(),

        const SizedBox(height: 30),

        _IntrosSection(),

        const SizedBox(height: 55),

        _StatsSection(),

        const SizedBox(height: 70),

        _ExpertisesSection(features: provider.features),

        const SizedBox(height: 60),

        _BottomsCTA(isDetails: isDetails),
      ],
    );
  }
}

class _TopsLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 45, height: 2, color: AboutNewsContent.yellow),

        const SizedBox(width: 14),

        const Text(
          'ABOUT ME',
          style: TextStyle(
            color: AboutNewsContent.yellow,
            fontSize: 13,
            fontWeight: FontWeight.w800,
            letterSpacing: 3,
          ),
        ),

        const Spacer(),

        Text(
          '01 / ABOUT',
          style: TextStyle(
            color: Colors.white.withValues(alpha: .35),
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
      ],
    ).animate().fadeIn(duration: 600.ms).slideX(begin: -.15, end: 0);
  }
}

class _IntrosSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final bool desktop = width >= 1000;

    if (desktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 6, child: _IntrosText()),

          const SizedBox(width: 60),

          Expanded(flex: 4, child: _ProfilesCard()),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_IntrosText(), const SizedBox(height: 40), _ProfilesCard()],
    );
  }
}

class _IntrosText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
              'Digital Growth\nStrategist & Business\nTransformation Expert',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                height: 1.08,
                letterSpacing: -1.2,
              ),
            )
            .animate()
            .fadeIn(delay: 150.ms, duration: 700.ms)
            .slideY(begin: .15, end: 0),

        const SizedBox(height: 28),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child:
              Text(
                    'I help businesses increase revenue through performance '
                    'marketing, business strategy, and digital transformation. '
                    'My approach combines creative thinking, measurable '
                    'marketing systems, and long-term business growth.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: .68),
                      height: 1.8,
                      fontSize: 16,
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 350.ms, duration: 700.ms)
                  .slideY(begin: .15, end: 0),
        ),

        const SizedBox(height: 30),

        _MiniTages(),
      ],
    );
  }
}

class _MiniTages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tags = [
      'Performance Marketing',
      'Business Strategy',
      'Lead Generation',
      'Brand Positioning',
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: tags.map((tag) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .06),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withValues(alpha: .08)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_rounded,
                size: 15,
                color: AboutNewsContent.yellow,
              ),

              const SizedBox(width: 7),

              Text(
                tag,
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
}

class _ProfilesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          constraints: const BoxConstraints(maxWidth: 430),
          decoration: BoxDecoration(
            color: AboutNewsContent.cardColor,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.white.withValues(alpha: .08)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .25),
                blurRadius: 35,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: AspectRatio(
                    aspectRatio: 0.9,
                    child: Image.asset(
                      'assets/images/aboutme.jpeg',
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) {
                        return Container(
                          color: const Color(0xff17152F),
                          child: const Icon(
                            Icons.person_rounded,
                            color: Colors.white24,
                            size: 90,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AboutNewsContent.yellow,
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Expanded(
                        child: Text(
                          'Digital Growth Strategist',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      Text(
                        '15+ YEARS',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: .4),
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        .animate()
        .fadeIn(delay: 300.ms, duration: 800.ms)
        .scale(begin: const Offset(.95, .95), end: const Offset(1, 1));
  }
}

class _StatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stats = [
      const _StatsData(
        value: '250+',
        label: 'Completed Projects',
        icon: Icons.rocket_launch_rounded,
      ),
      const _StatsData(
        value: '15+',
        label: 'Years Experience',
        icon: Icons.workspace_premium_rounded,
      ),
      const _StatsData(
        value: '92%',
        label: 'Growth Reach',
        icon: Icons.trending_up_rounded,
      ),
      const _StatsData(
        value: '4.8x',
        label: 'Average ROI',
        icon: Icons.insights_rounded,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool mobile = constraints.maxWidth < 600;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: stats.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: mobile ? 2 : 4,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: mobile ? 1.5 : 1.8,
          ),
          itemBuilder: (context, index) {
            return _StatCard(data: stats[index], index: index);
          },
        );
      },
    );
  }
}

class _StatsData {
  final String value;
  final String label;
  final IconData icon;

  const _StatsData({
    required this.value,
    required this.label,
    required this.icon,
  });
}

class _StatCard extends StatelessWidget {
  final _StatsData data;
  final int index;

  const _StatCard({required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AboutNewsContent.cardColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: .06)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(data.icon, color: AboutNewsContent.yellow, size: 22),

              const Spacer(),

              Text(
                data.value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                data.label,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: .48),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: 400 + (index * 120)),
          duration: 600.ms,
        )
        .slideY(begin: .2, end: 0);
  }
}

class _ExpertisesSection extends StatelessWidget {
  final List<String> features;

  const _ExpertisesSection({required this.features});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'MY EXPERTISE',
              style: TextStyle(
                color: AboutNewsContent.yellow,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 2.5,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Container(
                height: 1,
                color: Colors.white.withValues(alpha: .08),
              ),
            ),
          ],
        ),

        const SizedBox(height: 25),

        LayoutBuilder(
          builder: (context, constraints) {
            final bool mobile = constraints.maxWidth < 600;
            final bool tablet = constraints.maxWidth < 950;

            final columns = mobile
                ? 1
                : tablet
                ? 2
                : 4;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: features.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: mobile ? 3.2 : 1.25,
              ),
              itemBuilder: (context, index) {
                return _ExpertisesCard(title: features[index], index: index);
              },
            );
          },
        ),
      ],
    );
  }
}

class _ExpertisesCard extends StatelessWidget {
  final String title;
  final int index;

  const _ExpertisesCard({required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    final isHovered = context.select<MouseRegionProvider, bool>(
      (provider) => provider.isHovered(index),
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        context.read<MouseRegionProvider>().setHover(index);
      },

      onExit: (_) {
        context.read<MouseRegionProvider>().clearHover(index);
      },
      child:
          AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isHovered
                      ? AboutNewsContent.yellow.withValues(alpha: .12)
                      : AboutNewsContent.cardColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isHovered
                        ? AboutNewsContent.yellow.withValues(alpha: .45)
                        : Colors.white.withValues(alpha: .06),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      width: isHovered ? 42 : 34,
                      height: 3,
                      color: AboutNewsContent.yellow,
                    ),

                    const SizedBox(height: 20),

                    Text(
                      '0${index + 1}',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: .25),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const Spacer(),

                    Icon(
                      Icons.arrow_outward_rounded,
                      color: isHovered
                          ? AboutNewsContent.yellow
                          : Colors.white24,
                      size: 20,
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn(
                delay: Duration(milliseconds: 500 + (index * 120)),
                duration: 600.ms,
              )
              .slideY(begin: .15, end: 0),
    );
  }
}

class _BottomsCTA extends StatelessWidget {
  final bool isDetails;

  const _BottomsCTA({required this.isDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AboutNewsContent.yellow,
        borderRadius: BorderRadius.circular(25),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool mobile = constraints.maxWidth < 650;

          final content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ready to grow your business?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Let’s build a growth system that delivers measurable results.',
                style: TextStyle(
                  color: Colors.black.withValues(alpha: .65),
                  fontSize: 14,
                ),
              ),
            ],
          );

          final button = OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.black, width: 1.2),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'LET’S TALK',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward_rounded, size: 18),
              ],
            ),
          );

          if (mobile) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [content, const SizedBox(height: 22), button],
            );
          }

          return Row(
            children: [
              Expanded(child: content),
              button,
            ],
          );
        },
      ),
    ).animate().fadeIn(delay: 700.ms, duration: 700.ms).slideY(begin: .15, end: 0);
  }
}
