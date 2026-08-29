import 'package:flutter/material.dart';
import 'package:hassanzamin/features/services/provider/detail_screen_card_provider.dart';
import 'package:provider/provider.dart';

import 'package:hassanzamin/features/services/service_model.dart';

class DetailScreenCard extends StatelessWidget {
  final ServicesItem service;
  final int index;
  final VoidCallback onTap;

  const DetailScreenCard({
    super.key,
    required this.service,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<DetailScreenCardProvider, bool>(
      selector: (_, provider) => provider.isHovered(index),
      builder: (context, isHovered, child) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,

          onEnter: (_) {
            context.read<DetailScreenCardProvider>().setHover(index);
          },

          onExit: (_) {
            context.read<DetailScreenCardProvider>().clearHover(index);
          },

          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,

            child: AnimatedScale(
              scale: isHovered ? 1.015 : 1.0,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOutCubic,

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOutCubic,

                width: double.infinity,

                constraints: const BoxConstraints(minHeight: 135),

                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),

                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 22,
                ),

                decoration: BoxDecoration(
                  color: isHovered
                      ? const Color(0xffF5F5F5)
                      : const Color(0xff24204F),

                  borderRadius: BorderRadius.circular(24),

                  border: Border.all(
                    color: isHovered
                        ? const Color(0xffFFD43B)
                        : Colors.white.withValues(alpha: 0.85),
                    width: 1.4,
                  ),

                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: const Color(
                              0xffFFD43B,
                            ).withValues(alpha: 0.15),
                            blurRadius: 25,
                            offset: const Offset(0, 12),
                          ),
                        ]
                      : const [],
                ),

                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final compact = constraints.maxWidth < 500;

                    if (compact) {
                      return _CompactServiceLayout(
                        service: service,
                        isHovered: isHovered,
                      );
                    }

                    return _DesktopServiceLayout(
                      service: service,
                      isHovered: isHovered,
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ============================================================
// DESKTOP LAYOUT
// ============================================================

class _DesktopServiceLayout extends StatelessWidget {
  final ServicesItem service;
  final bool isHovered;

  const _DesktopServiceLayout({required this.service, required this.isHovered});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ServiceIcon(icon: service.icon, isHovered: isHovered),

        const SizedBox(width: 22),

        Expanded(
          child: _ServiceContent(
            title: service.title,
            description: service.description,
            isHovered: isHovered,
          ),
        ),

        const SizedBox(width: 20),

        _ServiceStats(service: service, isHovered: isHovered),

        const SizedBox(width: 18),

        _ServiceArrow(isHovered: isHovered),
      ],
    );
  }
}

// ============================================================
// COMPACT / MOBILE LAYOUT
// ============================================================

class _CompactServiceLayout extends StatelessWidget {
  final ServicesItem service;
  final bool isHovered;

  const _CompactServiceLayout({required this.service, required this.isHovered});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _ServiceIcon(icon: service.icon, isHovered: isHovered),

            const SizedBox(width: 18),

            Expanded(
              child: _ServiceContent(
                title: service.title,
                description: service.description,
                isHovered: isHovered,
              ),
            ),

            const SizedBox(width: 10),

            _ServiceArrow(isHovered: isHovered),
          ],
        ),

        AnimatedSize(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,

          child: isHovered
              ? Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: _ServiceStats(service: service, isHovered: isHovered),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

// ============================================================
// ICON
// ============================================================

class _ServiceIcon extends StatelessWidget {
  final IconData icon;
  final bool isHovered;

  const _ServiceIcon({required this.icon, required this.isHovered});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,

      width: 70,
      height: 70,

      decoration: BoxDecoration(
        color: isHovered ? const Color(0xff24204F) : const Color(0xffFFD43B),

        borderRadius: BorderRadius.circular(18),
      ),

      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),

        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },

        child: Icon(
          icon,
          key: ValueKey<bool>(isHovered),
          size: 32,

          color: isHovered ? const Color(0xffFFD43B) : const Color(0xff24204F),
        ),
      ),
    );
  }
}

// ============================================================
// CONTENT
// ============================================================

class _ServiceContent extends StatelessWidget {
  final String title;
  final String description;
  final bool isHovered;

  const _ServiceContent({
    required this.title,
    required this.description,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,

          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
            height: 1.15,

            color: isHovered ? const Color(0xff24204F) : Colors.white,
          ),

          child: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
        ),

        const SizedBox(height: 8),

        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,

          style: TextStyle(
            fontSize: 15,
            height: 1.55,
            fontWeight: FontWeight.w400,

            color: isHovered
                ? const Color(0xff4D496D)
                : Colors.white.withValues(alpha: 0.60),
          ),

          child: Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// STATS
// ============================================================

class _ServiceStats extends StatelessWidget {
  final ServicesItem service;
  final bool isHovered;

  const _ServiceStats({required this.service, required this.isHovered});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,

      child: isHovered
          ? FadeTransition(
              opacity: AlwaysStoppedAnimation<double>(isHovered ? 1.0 : 0.0),

              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildStat(service.metricOne, service.metricOneLabel),

                  ...[
                    const SizedBox(width: 22),

                    _buildStat(service.metricTwo, service.metricTwoLabel),
                  ],
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xff24204F),
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 2),

        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Color(0xff77738E),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// ARROW
// ============================================================

class _ServiceArrow extends StatelessWidget {
  final bool isHovered;

  const _ServiceArrow({required this.isHovered});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,

      width: isHovered ? 48 : 32,
      height: isHovered ? 48 : 32,

      decoration: BoxDecoration(
        color: isHovered ? const Color(0xffFFD43B) : Colors.transparent,

        shape: BoxShape.circle,
      ),

      child: Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),

          style: TextStyle(
            color: isHovered
                ? const Color(0xff24204F)
                : Colors.white.withValues(alpha: 0.65),

            fontSize: isHovered ? 24 : 28,

            fontWeight: FontWeight.w300,
          ),

          child: const Text('→'),
        ),
      ),
    );
  }
}
