import 'package:flutter/material.dart';
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
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),

      onExit: (_) => setState(() => hover = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        transform: Matrix4.identity()
          ..scaleByVector3(
            Vector3(hover ? 1.05 : 1.0, hover ? 1.05 : 1.0, 1.0),
          ),

        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(170, 60),

            side: BorderSide(color: hover ? AppColors.yellow : Colors.white54),

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
