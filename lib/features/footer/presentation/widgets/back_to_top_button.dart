import 'package:flutter/material.dart';

class BackToTopButton extends StatelessWidget {
  final ScrollController controller;

  const BackToTopButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xffF8F54B),

      onPressed: () {
        controller.animateTo(
          0,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
        );
      },

      child: const Icon(Icons.keyboard_arrow_up, color: Colors.black),
    );
  }
}
