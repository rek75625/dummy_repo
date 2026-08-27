import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:hassanzamin/core/constants/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // 1. Wrap with an isolated provider scoped uniquely to this instance
    return Builder(
      builder: (context) {
        // 2. Watch the isolated hover state
        final isHovered = context.watch<MouseRegionProvider>().hover;

        return MouseRegion(
          // 3. Use 'read' inside your interactions
          onEnter: (_) => context.read<MouseRegionProvider>().setHover(true),
          onExit: (_) => context.read<MouseRegionProvider>().setHover(false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            transform: Matrix4.identity()
              ..scaleByVector3(
                Vector3(isHovered ? 1.05 : 1.0, isHovered ? 1.05 : 1.0, 1.0),
              ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellow,
                foregroundColor: AppColors.black,
                minimumSize: const Size(170, 60),
                elevation: isHovered ? 12 : 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: onPressed,
              child: Text(text),
            ),
          ),
        );
      },
    );
  }
}
