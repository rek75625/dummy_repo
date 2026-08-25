import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

import '../constants/app_colors.dart';

class PrimaryButton extends StatefulWidget {
  final String text;

  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
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

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.yellow,

            foregroundColor: Colors.black,

            minimumSize: const Size(170, 60),

            elevation: hover ? 12 : 4,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          onPressed: widget.onPressed,

          child: Text(widget.text),
        ),
      ),
    );
  }
}
