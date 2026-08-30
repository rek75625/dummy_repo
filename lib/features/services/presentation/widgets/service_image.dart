import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:provider/provider.dart';

class ServicesImage extends StatelessWidget {
  final String imagePath;
  final int index;

  const ServicesImage({
    super.key,
    this.imagePath = 'assets/images/aboutme.jpeg',
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isHover = context.select<MouseRegionProvider, bool>(
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
      child: AnimatedScale(
        scale: isHover ? 1.015 : 1.0,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOut,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isHover ? 0.30 : 0.20),
                blurRadius: isHover ? 35 : 25,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: AspectRatio(
              aspectRatio: 0.86,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xff292651),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.image_outlined,
                      color: Colors.white54,
                      size: 50,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
