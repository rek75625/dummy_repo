import 'dart:math';
import 'package:flutter/material.dart';

class ContactBackground extends StatefulWidget {
  const ContactBackground({super.key});

  @override
  State<ContactBackground> createState() => _ContactBackgroundState();
}

class _ContactBackgroundState extends State<ContactBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) {
        return CustomPaint(painter: _BackgroundPainter(_controller.value));
      },
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  final double progress;

  _BackgroundPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //--------------------------------------------------------
    // Base Background
    //--------------------------------------------------------

    paint.shader = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xffF7F9FD), Color(0xffEEF3FF)],
    ).createShader(Offset.zero & size);

    canvas.drawRect(Offset.zero & size, paint);

    //--------------------------------------------------------
    // Large Yellow Glow
    //--------------------------------------------------------

    paint.shader =
        RadialGradient(
          colors: [
            Color(0xffFFD83D).withValues(alpha: .20),
            Colors.transparent,
          ],
        ).createShader(
          Rect.fromCircle(
            center: Offset(size.width * .15, size.height * .15),
            radius: 260,
          ),
        );

    canvas.drawCircle(Offset(size.width * .15, size.height * .15), 260, paint);

    //--------------------------------------------------------
    // Blue Glow
    //--------------------------------------------------------

    paint.shader =
        RadialGradient(
          colors: [
            const Color(0xff26224F).withValues(alpha: .10),
            Colors.transparent,
          ],
        ).createShader(
          Rect.fromCircle(
            center: Offset(size.width * .90, size.height * .15),
            radius: 240,
          ),
        );

    canvas.drawCircle(Offset(size.width * .90, size.height * .15), 240, paint);

    //--------------------------------------------------------
    // Floating Circles
    //--------------------------------------------------------

    final circlePaint = Paint()
      ..color = const Color(0xffFFD83D).withValues(alpha: .18);

    for (int i = 0; i < 8; i++) {
      final dx = (size.width / 8) * i;

      final dy = size.height * .55 + sin(progress * pi * 2 + i) * 20;

      canvas.drawCircle(Offset(dx + 20, dy), 8, circlePaint);
    }

    //--------------------------------------------------------
    // Dots Pattern
    //--------------------------------------------------------

    final dotPaint = Paint()
      ..color = const Color(0xff26224F).withValues(alpha: .05);

    const gap = 35.0;

    for (double x = 0; x < size.width; x += gap) {
      for (double y = 0; y < size.height; y += gap) {
        canvas.drawCircle(Offset(x, y), 1.2, dotPaint);
      }
    }

    //--------------------------------------------------------
    // Decorative Rings
    //--------------------------------------------------------

    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = const Color(0xffFFD83D).withValues(alpha: .18);

    canvas.drawCircle(Offset(size.width * .82, size.height * .82), 120, ring);

    canvas.drawCircle(Offset(size.width * .82, size.height * .82), 165, ring);

    //--------------------------------------------------------
    // Bottom Left Blob
    //--------------------------------------------------------

    final blob = Paint()
      ..color = const Color(0xff26224F).withValues(alpha: .04);

    final path = Path();

    path.moveTo(0, size.height);

    path.quadraticBezierTo(
      size.width * .18,
      size.height * .72,
      size.width * .42,
      size.height,
    );

    path.close();

    canvas.drawPath(path, blob);
  }

  @override
  bool shouldRepaint(covariant _BackgroundPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
