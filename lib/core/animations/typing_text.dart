import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TypingText extends StatelessWidget {
  final String text;

  final TextStyle style;

  const TypingText({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,

      pause: const Duration(seconds: 1),

      animatedTexts: [
        TypewriterAnimatedText(
          text,

          speed: const Duration(milliseconds: 55),

          textStyle: style,
        ),
      ],
    );
  }
}
