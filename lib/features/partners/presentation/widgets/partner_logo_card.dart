import 'package:flutter/material.dart';
import 'package:hassanzamin/features/partners/provider/partner_provider.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class PartnerLogoCard extends StatelessWidget {
  final String image;
  final int index;

  const PartnerLogoCard({super.key, required this.image, required this.index});

  @override
  Widget build(BuildContext context) {
    final isHovered = context.select<MouseRegionForPartnerProvider, bool>(
      (provider) => provider.isHovered(index),
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        context.read<MouseRegionForPartnerProvider>().setHover(index);
      },

      onExit: (_) {
        context.read<MouseRegionForPartnerProvider>().clearHover(index);
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,

        width: 180,
        height: 90,

        margin: const EdgeInsets.symmetric(horizontal: 15),

        transform: Matrix4.identity()
          ..scaleByVector3(
            Vector3(isHovered ? 1.08 : 1.0, isHovered ? 1.08 : 1.0, 1.0),
          ),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isHovered ? 0.14 : 0.08),
              blurRadius: isHovered ? 18 : 8,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: AnimatedPadding(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,

          padding: EdgeInsets.all(isHovered ? 14 : 18),

          child: Image.asset(image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
