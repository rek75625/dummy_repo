import 'package:flutter/material.dart';

class SectionSpacing extends StatelessWidget {
  const SectionSpacing({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(height: width < 768 ? 70 : 120);
  }
}
