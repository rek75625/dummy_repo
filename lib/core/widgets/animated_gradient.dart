import 'package:flutter/material.dart';

class AnimatedGradient extends StatefulWidget {
  final Widget child;

  const AnimatedGradient({super.key, required this.child});

  @override
  State<AnimatedGradient> createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<AnimatedGradient> {
  bool toggle = false;

  @override
  void initState() {
    super.initState();

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 4));

      if (!mounted) return false;

      setState(() {
        toggle = !toggle;
      });

      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 4),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: toggle ? Alignment.topLeft : Alignment.bottomRight,

          end: toggle ? Alignment.bottomRight : Alignment.topLeft,

          colors: const [
            Color(0xff211E4B),

            Color(0xff2A2757),

            Color(0xff37306D),
          ],
        ),
      ),

      child: widget.child,
    );
  }
}
