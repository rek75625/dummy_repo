import 'package:flutter/material.dart';
import 'package:hassanzamin/core/constants/app_colors.dart';
import 'package:hassanzamin/features/services/provider/our_service_provider.dart';
import 'package:provider/provider.dart';

class OurServiceCard extends StatelessWidget {
  final int index;

  const OurServiceCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OurServiceProvider>();
    final service = provider.services[index];

    final bool hovered = provider.isHovered(index);

    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        provider.setHovered(index);
      },

      onExit: (_) {
        provider.clearHovered(index);
      },

      child: AnimatedScale(
        scale: hovered ? 1.025 : 1.0,
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),

            // ==========================================================
            // CARD BORDER
            // ==========================================================
            border: Border.all(
              color: hovered
                  ? AppColors.yellow.withValues(alpha: .65)
                  : Colors.white.withValues(alpha: .14),
              width: hovered ? 1.4 : 1,
            ),

            // ==========================================================
            // CARD BACKGROUND
            // ==========================================================
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: hovered
                  ? [const Color(0xff17142F), const Color(0xff0E0D1C)]
                  : [const Color(0xff15132C), const Color(0xff0D0C19)],
            ),

            boxShadow: [
              BoxShadow(
                color: hovered
                    ? AppColors.yellow.withValues(alpha: .08)
                    : Colors.black.withValues(alpha: .25),
                blurRadius: hovered ? 35 : 22,
                offset: const Offset(0, 15),
              ),
            ],
          ),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),

            child: Stack(
              fit: StackFit.expand,
              children: [
                // ========================================================
                // DECORATIVE TOP RIGHT GLOW
                // ========================================================

                AnimatedPositioned(
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.easeOutCubic,

                  top: hovered ? -55 : -70,
                  right: hovered ? -35 : -55,

                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 450),

                    width: 180,
                    height: 180,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      color: AppColors.yellow.withValues(
                        alpha: hovered ? .075 : .035,
                      ),
                    ),
                  ),
                ),

                // ========================================================
                // SECOND DECORATIVE GLOW
                // ========================================================
                Positioned(
                  bottom: -90,
                  left: -90,

                  child: Container(
                    width: 180,
                    height: 180,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      color: const Color(0xff4B3E91).withValues(alpha: .035),
                    ),
                  ),
                ),

                // ========================================================
                // VERY SUBTLE GRID / LINE EFFECT
                // ========================================================
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 45,

                  child: Container(
                    width: 1,

                    color: Colors.white.withValues(alpha: .025),
                  ),
                ),

                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,

                  child: Container(
                    height: 1,

                    color: Colors.white.withValues(alpha: .018),
                  ),
                ),

                // ========================================================
                // CONTENT
                // ========================================================
                Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ====================================================
                      // TOP ROW
                      // ====================================================

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          // NUMBER
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),

                            width: 34,
                            height: 34,

                            alignment: Alignment.center,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              color: hovered
                                  ? AppColors.yellow.withValues(alpha: .08)
                                  : Colors.transparent,

                              border: Border.all(
                                color: AppColors.yellow.withValues(alpha: .45),
                              ),
                            ),

                            child: Text(
                              (index + 1).toString().padLeft(2, '0'),

                              style: TextStyle(
                                color: AppColors.yellow,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1,
                              ),
                            ),
                          ),

                          // ICON
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),

                            width: 44,
                            height: 44,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              color: hovered
                                  ? AppColors.yellow
                                  : Colors.white.withValues(alpha: .045),

                              border: Border.all(
                                color: hovered
                                    ? AppColors.yellow
                                    : Colors.white.withValues(alpha: .14),
                              ),

                              boxShadow: hovered
                                  ? [
                                      BoxShadow(
                                        color: AppColors.yellow.withValues(
                                          alpha: .15,
                                        ),
                                        blurRadius: 18,
                                      ),
                                    ]
                                  : [],
                            ),

                            child: AnimatedRotation(
                              duration: const Duration(milliseconds: 350),

                              turns: hovered ? .04 : 0,

                              child: Icon(
                                service.icon,

                                size: 19,

                                color: hovered ? Colors.black : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      // ====================================================
                      // SMALL LABEL
                      // ====================================================
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),

                            width: hovered ? 25 : 20,
                            height: 2,

                            decoration: BoxDecoration(
                              color: AppColors.yellow,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),

                          const SizedBox(width: 8),

                          Text(
                            'SERVICE',

                            style: TextStyle(
                              color: AppColors.yellow,
                              fontSize: 8,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.6,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // ====================================================
                      // TITLE
                      // ====================================================
                      Text(
                        service.title,

                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          height: 1.05,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -.7,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // ====================================================
                      // DESCRIPTION
                      // ====================================================
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),

                        style: TextStyle(
                          color: Colors.white.withValues(
                            alpha: hovered ? .72 : .58,
                          ),
                          fontSize: 12,
                          height: 1.45,
                          fontWeight: FontWeight.w400,
                        ),

                        child: Text(
                          service.shortDescription,

                          maxLines: hovered ? 3 : 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      const SizedBox(height: 14),

                      // ====================================================
                      // POINTS
                      // ====================================================
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,

                        children: service.points
                            .take(4)
                            .map((point) => _buildPoint(point, hovered))
                            .toList(),
                      ),

                      const SizedBox(height: 15),

                      // ====================================================
                      // METRICS
                      // ====================================================
                      Row(
                        children: [
                          Expanded(
                            child: _buildMetric(
                              service.metricOne,
                              service.metricOneLabel,
                              hovered,
                            ),
                          ),

                          const SizedBox(width: 8),

                          Expanded(
                            child: _buildMetric(
                              service.metricTwo,
                              service.metricTwoLabel,
                              hovered,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      // ====================================================
                      // DIVIDER
                      // ====================================================
                      Container(
                        height: 1,

                        color: Colors.white.withValues(alpha: .10),
                      ),

                      const SizedBox(height: 12),

                      // ====================================================
                      // EXPLORE
                      // ====================================================
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),

                        opacity: hovered ? 1 : .62,

                        child: Row(
                          children: [
                            Text(
                              'EXPLORE SERVICE',

                              style: TextStyle(
                                color: hovered
                                    ? AppColors.yellow
                                    : Colors.white,

                                fontSize: 8,

                                fontWeight: FontWeight.w800,

                                letterSpacing: 1.4,
                              ),
                            ),

                            const SizedBox(width: 8),

                            AnimatedSlide(
                              duration: const Duration(milliseconds: 250),

                              offset: hovered
                                  ? const Offset(.3, 0)
                                  : Offset.zero,

                              child: Icon(
                                Icons.arrow_forward_rounded,

                                size: 15,

                                color: hovered
                                    ? AppColors.yellow
                                    : Colors.white54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================================================================
  // POINT
  // ================================================================

  Widget _buildPoint(String text, bool hovered) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),

      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),

      decoration: BoxDecoration(
        color: hovered
            ? AppColors.yellow.withValues(alpha: .07)
            : Colors.white.withValues(alpha: .025),

        borderRadius: BorderRadius.circular(20),

        border: Border.all(
          color: hovered
              ? AppColors.yellow.withValues(alpha: .20)
              : Colors.white.withValues(alpha: .09),
        ),
      ),

      child: Text(
        text,

        style: TextStyle(
          color: Colors.white.withValues(alpha: hovered ? .78 : .60),

          fontSize: 8,

          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ================================================================
  // METRIC
  // ================================================================

  Widget _buildMetric(String value, String label, bool hovered) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),

      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),

      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: .22),

        borderRadius: BorderRadius.circular(11),

        border: Border.all(
          color: hovered
              ? AppColors.yellow.withValues(alpha: .15)
              : Colors.white.withValues(alpha: .08),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            value,

            maxLines: 1,
            overflow: TextOverflow.ellipsis,

            style: TextStyle(
              color: hovered ? AppColors.yellow : Colors.white,

              fontSize: 18,

              fontWeight: FontWeight.w800,

              letterSpacing: -.4,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            label,

            maxLines: 1,
            overflow: TextOverflow.ellipsis,

            style: TextStyle(
              color: Colors.white.withValues(alpha: .42),

              fontSize: 6.5,

              fontWeight: FontWeight.w800,

              letterSpacing: .7,
            ),
          ),
        ],
      ),
    );
  }
}
