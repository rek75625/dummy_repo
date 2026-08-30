import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/skill_provider.dart';
import 'statistics_counter.dart';

class StatisticsRow extends StatelessWidget {
  const StatisticsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SkillProvider>();

    final width = MediaQuery.of(context).size.width;

    final bool desktop = width >= 1200;
    final bool tablet = width >= 768 && width < 1200;

    if (desktop) {
      return Row(
        children: provider.statistics.map((stat) {
          return Expanded(
            child: StatisticsCounter(value: stat.value, title: stat.title),
          );
        }).toList(),
      );
    }

    if (tablet) {
      return Wrap(
        spacing: 24,
        runSpacing: 24,
        alignment: WrapAlignment.center,
        children: provider.statistics.map((stat) {
          return SizedBox(
            width: 220,
            child: StatisticsCounter(value: stat.value, title: stat.title),
          );
        }).toList(),
      );
    }

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: provider.statistics.map((stat) {
        return SizedBox(
          width: 150,
          child: StatisticsCounter(value: stat.value, title: stat.title),
        );
      }).toList(),
    );
  }
}
