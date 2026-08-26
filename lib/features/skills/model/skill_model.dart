import 'package:flutter/material.dart';

class SkillPageData {
  final String title;
  final IconData icon;
  final String image;
  final String subtitle;
  final String description;

  final List<String> services;

  final List<(String, String)> metrics;

  final List<String> process;

  final String resultTitle;
  final String resultDescription;

  const SkillPageData({
    required this.title,
    required this.icon,
    required this.image,
    required this.subtitle,
    required this.description,
    required this.services,
    required this.metrics,
    required this.process,
    required this.resultTitle,
    required this.resultDescription,
  });
}
