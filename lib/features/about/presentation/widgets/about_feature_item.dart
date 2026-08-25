import 'package:flutter/material.dart';

class AboutFeatureItem extends StatelessWidget {
  final String title;

  const AboutFeatureItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Wrap(spacing: 12, runSpacing: 12, children: [_skillChip(title)]),
    );
  }
}

Widget _skillChip(String title) {
  return Chip(
    label: Text(
      title,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
    ),
    avatar: const Icon(Icons.check, color: Colors.amber, size: 18),
    backgroundColor: const Color(0xff34315F),
    side: BorderSide.none,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  );
}
