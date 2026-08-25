import 'package:flutter/material.dart';

class HeroBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: .04)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path();

    path.moveTo(0, size.height * .25);

    path.quadraticBezierTo(
      size.width * .35,
      size.height * .05,
      size.width,
      size.height * .30,
    );

    path.moveTo(0, size.height * .60);

    path.quadraticBezierTo(
      size.width * .60,
      size.height * .35,
      size.width,
      size.height * .75,
    );

    canvas.drawPath(path, paint);

    canvas.drawCircle(
      Offset(size.width * .15, size.height * .30),
      120,
      Paint()
        ..color = Colors.white.withValues(alpha: .02)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    canvas.drawCircle(
      Offset(size.width * .82, size.height * .18),
      160,
      Paint()
        ..color = Colors.white.withValues(alpha: .03)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
