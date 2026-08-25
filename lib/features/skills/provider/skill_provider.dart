import 'package:flutter/material.dart';

import '../model/skill_model.dart';

class StatisticModel {
  final String title;
  final int value;

  const StatisticModel({required this.title, required this.value});
}

class SkillProvider extends ChangeNotifier {
  final List<StatisticModel> statistics = const [
    StatisticModel(title: "Projects", value: 250),

    StatisticModel(title: "Clients", value: 120),

    StatisticModel(title: "Awards", value: 18),

    StatisticModel(title: "Reviews", value: 340),
  ];

  final List<SkillModel> skills = const [
    SkillModel(title: "Digital Marketing", icon: Icons.campaign),

    SkillModel(title: "Performance Ads", icon: Icons.ads_click),

    SkillModel(title: "Brand Growth", icon: Icons.trending_up),

    SkillModel(title: "Lead Generation", icon: Icons.people),

    SkillModel(title: "Business Consulting", icon: Icons.business_center),

    SkillModel(title: "Sales Funnel", icon: Icons.auto_graph),

    SkillModel(title: "SEO", icon: Icons.search),

    SkillModel(title: "Meta Ads", icon: Icons.public),

    SkillModel(title: "Mentorship", icon: Icons.school),
  ];
}
