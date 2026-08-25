import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hassanzamin/core/constants/app_colors.dart';

class FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool mobile = width < 768;
    final bool tablet = width >= 768 && width < 1200;

    final bool enableHover = kIsWeb || width >= 1200;

    return MouseRegion(
      onEnter: enableHover ? (_) => setState(() => hover = true) : null,
      onExit: enableHover ? (_) => setState(() => hover = false) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,

        padding: EdgeInsets.all(
          mobile
              ? 18
              : tablet
              ? 22
              : 26,
        ),

        transform: Matrix4.translationValues(0, hover ? -8 : 0, 0),

        decoration: BoxDecoration(
          color: hover ? Colors.grey.shade200 : AppColors.background,
          borderRadius: BorderRadius.circular(24),

          border: Border.all(
            color: hover ? const Color(0xffFFD83D) : Colors.grey.shade200,
            width: 1.5,
          ),

          boxShadow: [
            BoxShadow(
              color: hover
                  ? const Color(0xffFFD83D).withValues(alpha: .20)
                  : Colors.black.withValues(alpha: .05),
              blurRadius: hover ? 35 : 15,
              offset: const Offset(0, 12),
            ),
          ],
        ),

        child: Row(
          children: [
            //------------------------------------------------
            // Icon
            //------------------------------------------------
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),

              width: mobile ? 55 : 70,
              height: mobile ? 55 : 70,

              decoration: BoxDecoration(
                color: hover
                    ? const Color(0xff26224F)
                    : const Color(0xffFFD83D),

                borderRadius: BorderRadius.circular(18),
              ),

              child: Icon(
                widget.icon,
                color: hover
                    ? const Color(0xffFFD83D)
                    : const Color(0xff26224F),
                size: mobile ? 28 : 34,
              ),
            ),

            const SizedBox(width: 22),

            //------------------------------------------------
            // Text
            //------------------------------------------------
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      fontSize: mobile ? 18 : 22,
                      fontWeight: FontWeight.bold,
                      color: hover ? const Color(0xff26224F) : Colors.black87,
                    ),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        color: hover ? AppColors.background : Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      color: hover ? AppColors.background : Colors.grey,
                      height: 1.6,
                      fontSize: mobile ? 14 : 15,
                    ),
                  ),
                ],
              ),
            ),

            //------------------------------------------------
            // Arrow
            //------------------------------------------------
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),

              width: 45,
              height: 45,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: hover ? const Color(0xffFFD83D) : Colors.transparent,
              ),

              child: Icon(
                Icons.arrow_forward_rounded,
                color: hover ? const Color(0xff26224F) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
