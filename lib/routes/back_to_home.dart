import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/fade_animation.dart';

class CustomBackToHome extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomBackToHome({
    super.key,
    required this.onPressed,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 768;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 14 : 20,
        vertical: isMobile ? 8 : 12,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        children: [
          Icon(Icons.home, color: Colors.white, size: 20),
          FadeSlideAnimation(
            delay: Duration(milliseconds: 600),
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),

          Icon(Icons.chevron_right, color: Colors.white, size: 18),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
