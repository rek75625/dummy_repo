import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class PartnerLogoCard extends StatelessWidget {
  final String image;

  const PartnerLogoCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final isHovered = context.watch<MouseRegionProvider>().hover;
    return MouseRegion(
      onEnter: (_) => context.watch<MouseRegionProvider>().setHover(true),
      onExit: (_) => context.watch<MouseRegionProvider>().setHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
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
              color: Colors.black.withValues(alpha: .08),
              blurRadius: isHovered ? 18 : 8,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Image.asset(image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
