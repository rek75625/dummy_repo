import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBackgroundPainter extends CustomPainter {
  final double progress;

  AnimatedBackgroundPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff2A2757).withValues(alpha: .15)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < 20; i++) {
      final path = Path();

      final startY = (i * 50) + progress * 20;

      path.moveTo(0, startY);

      for (double x = 0; x <= size.width; x += 40) {
        path.lineTo(x, startY + sin((x / 60) + progress) * 10);
      }

      canvas.drawPath(path, paint);
    }

    final dotPaint = Paint()
      ..color = const Color(0xffF8F54B).withValues(alpha: .2);

    for (int i = 0; i < 30; i++) {
      canvas.drawCircle(
        Offset(
          Random(i).nextDouble() * size.width,
          Random(i * 2).nextDouble() * size.height,
        ),
        3,
        dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant AnimatedBackgroundPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
