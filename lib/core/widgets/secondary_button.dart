import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

import '../constants/app_colors.dart';

class SecondaryButton extends StatefulWidget {
  final String text;

  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
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

          onPressed: widget.onPressed,

          child: Text(widget.text, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
