import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hassanzamin/core/animations/fade_animation.dart';

class CustomBackToHome extends StatelessWidget {
  final String title;

  const CustomBackToHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

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
          const Icon(Icons.home, color: Colors.white, size: 20),

          FadeSlideAnimation(
            delay: const Duration(milliseconds: 600),
            child: TextButton(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.goNamed('home');
                }
              },
              child: const Text(
                'Home',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),

          const Icon(Icons.chevron_right, color: Colors.white, size: 18),

          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
