import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

import '../constants/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.index,
  });

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

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        transform: Matrix4.identity()
          ..scaleByVector3(
            Vector3(isHovered ? 1.05 : 1.0, isHovered ? 1.05 : 1.0, 1.0),
          ),

        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(170, 60),

            side: BorderSide(
              color: isHovered ? AppColors.yellow : Colors.white54,
            ),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          onPressed: onPressed,

          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
