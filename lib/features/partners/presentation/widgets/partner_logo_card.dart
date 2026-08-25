import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class PartnerLogoCard extends StatefulWidget {
  final String image;

  const PartnerLogoCard({super.key, required this.image});

  @override
  State<PartnerLogoCard> createState() => _PartnerLogoCardState();
}

class _PartnerLogoCardState extends State<PartnerLogoCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 180,
        height: 90,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        transform: Matrix4.identity()
          ..scaleByVector3(
            Vector3(hover ? 1.08 : 1.0, hover ? 1.08 : 1.0, 1.0),
          ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .08),
              blurRadius: hover ? 18 : 8,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Image.asset(widget.image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
