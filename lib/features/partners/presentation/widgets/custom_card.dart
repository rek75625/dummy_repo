import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:hassanzamin/features/partners/models/partner_model.dart';
import 'package:provider/provider.dart';

class CompanysCard extends StatelessWidget {
  final int index;
  final CompanysModel company;

  const CompanysCard({super.key, required this.company, required this.index});

  @override
  Widget build(BuildContext context) {
    final isHovered = context.select<MouseRegionProvider, bool>(
      (provider) => provider.isHovered(index),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;

        final bool mobile = cardWidth < 360;
        final bool compact = cardWidth >= 360 && cardWidth < 500;

        final double radius = mobile ? 20 : 24;

        return MouseRegion(
          cursor: SystemMouseCursors.click,

          onEnter: (_) {
            context.read<MouseRegionProvider>().setHover(index);
          },

          onExit: (_) {
            context.read<MouseRegionProvider>().clearHover(index);
          },

          child: GestureDetector(
            onTap: () => _showCompanyDetails(context),

            child: AnimatedScale(
              scale: isHovered ? 1.025 : 1.0,
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),

                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isHovered
                        ? const [Color(0xff34306B), Color(0xff211E4B)]
                        : const [Color(0xff292553), Color(0xff1D1A40)],
                  ),

                  border: Border.all(
                    color: isHovered
                        ? const Color(0xffffc107).withValues(alpha: .55)
                        : Colors.white.withValues(alpha: .08),
                    width: isHovered ? 1.3 : 1,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: isHovered
                          ? const Color(0xffffc107).withValues(alpha: .14)
                          : Colors.black.withValues(alpha: .20),
                      blurRadius: isHovered ? 28 : 18,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius),

                  child: Stack(
                    children: [
                      // =================================================
                      // DECORATIVE CIRCLES
                      // =================================================

                      Positioned(
                        top: -45,
                        right: -45,

                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),

                          width: isHovered ? 145 : 125,
                          height: isHovered ? 145 : 125,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(
                              0xffffc107,
                            ).withValues(alpha: isHovered ? .10 : .045),
                          ),
                        ),
                      ),

                      Positioned(
                        left: -55,
                        bottom: -55,

                        child: Container(
                          width: 140,
                          height: 140,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(
                              0xff6C63FF,
                            ).withValues(alpha: .07),
                          ),
                        ),
                      ),

                      // =================================================
                      // MAIN CONTENT
                      // =================================================
                      Padding(
                        padding: EdgeInsets.all(
                          mobile
                              ? 16
                              : compact
                              ? 18
                              : 22,
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            // Logo
                            _logo(isHovered),

                            SizedBox(height: mobile ? 14 : 18),

                            // Company name
                            Text(
                              company.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: mobile
                                    ? 17
                                    : compact
                                    ? 18
                                    : 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const SizedBox(height: 8),

                            // Category
                            _category(),

                            const SizedBox(height: 12),

                            // Description
                            Flexible(
                              child: Text(
                                company.description,
                                maxLines: mobile ? 3 : 4,
                                overflow: TextOverflow.ellipsis,

                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: .65),
                                  fontSize: mobile ? 12.5 : 13.5,
                                  height: 1.5,
                                ),
                              ),
                            ),

                            const SizedBox(height: 14),

                            // Button
                            _viewButton(context, isHovered),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // LOGO
  // ============================================================

  Widget _logo(bool isHovered) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),

      width: 76,
      height: 76,

      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: isHovered
              ? const Color(0xffffc107).withValues(alpha: .55)
              : Colors.white.withValues(alpha: .08),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isHovered ? .25 : .12),
            blurRadius: isHovered ? 18 : 10,
            offset: const Offset(0, 7),
          ),
        ],
      ),

      child: Image.asset(
        company.logo,
        fit: BoxFit.contain,

        errorBuilder: (_, _, _) {
          return const Icon(
            Icons.business_rounded,
            color: Color(0xff211E4B),
            size: 34,
          );
        },
      ),
    );
  }

  // ============================================================
  // CATEGORY
  // ============================================================

  Widget _category() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),

      decoration: BoxDecoration(
        color: const Color(0xffffc107).withValues(alpha: .10),

        borderRadius: BorderRadius.circular(30),

        border: Border.all(
          color: const Color(0xffffc107).withValues(alpha: .22),
        ),
      ),

      child: Text(
        company.category,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,

        style: const TextStyle(
          color: Color(0xffffc107),
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ============================================================
  // VIEW BUTTON
  // ============================================================

  Widget _viewButton(BuildContext context, bool isHovered) {
    return SizedBox(
      width: double.infinity,
      height: 42,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),

        decoration: BoxDecoration(
          color: isHovered
              ? const Color(0xffffc107)
              : Colors.white.withValues(alpha: .055),

          borderRadius: BorderRadius.circular(13),

          border: Border.all(
            color: isHovered
                ? const Color(0xffffc107)
                : Colors.white.withValues(alpha: .10),
          ),
        ),

        child: Material(
          color: Colors.transparent,

          child: InkWell(
            borderRadius: BorderRadius.circular(13),

            onTap: () => _showCompanyDetails(context),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  'View Company',

                  style: TextStyle(
                    color: isHovered ? const Color(0xff211E4B) : Colors.white,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(width: 8),

                AnimatedSlide(
                  duration: const Duration(milliseconds: 200),

                  offset: isHovered ? const Offset(.15, 0) : Offset.zero,

                  child: Icon(
                    Icons.arrow_forward_rounded,
                    size: 17,

                    color: isHovered
                        ? const Color(0xff211E4B)
                        : const Color(0xffffc107),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // COMPANY DETAILS
  // ============================================================

  void _showCompanyDetails(BuildContext context) {
    showDialog(
      context: context,

      barrierColor: Colors.black.withValues(alpha: .78),

      builder: (dialogContext) {
        final width = MediaQuery.sizeOf(dialogContext).width;

        final bool mobile = width < 600;

        return Dialog(
          backgroundColor: Colors.transparent,

          insetPadding: EdgeInsets.symmetric(
            horizontal: mobile ? 16 : 30,
            vertical: 24,
          ),

          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),

            child: Container(
              padding: EdgeInsets.all(mobile ? 20 : 28),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,

                  colors: [Color(0xff302B63), Color(0xff211E4B)],
                ),

                borderRadius: BorderRadius.circular(mobile ? 22 : 28),

                border: Border.all(color: Colors.white.withValues(alpha: .10)),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .45),
                    blurRadius: 40,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),

              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Container(
                          width: mobile ? 62 : 76,
                          height: mobile ? 62 : 76,

                          padding: const EdgeInsets.all(9),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(17),
                          ),

                          child: Image.asset(
                            company.logo,
                            fit: BoxFit.contain,

                            errorBuilder: (_, _, _) {
                              return const Icon(
                                Icons.business,
                                color: Color(0xff211E4B),
                              );
                            },
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                company.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,

                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: mobile ? 19 : 23,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                company.category,

                                style: const TextStyle(
                                  color: Color(0xffffc107),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                          tooltip: 'Close',

                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                          },

                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Text(
                      company.description,

                      style: TextStyle(
                        color: Colors.white.withValues(alpha: .72),
                        fontSize: mobile ? 14 : 15,
                        height: 1.7,
                      ),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: 50,

                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Add url_launcher here.
                        },

                        icon: const Icon(Icons.language_rounded, size: 19),

                        label: const Text('Visit Official Website'),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffffc107),
                          foregroundColor: const Color(0xff211E4B),
                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
