import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hassanzamin/features/home/provider/home_provider.dart';
import 'package:hassanzamin/features/skills/presentation/screen/skills_details_screen.dart';
import 'package:hassanzamin/repositories/responsive.dart';
import 'package:provider/provider.dart';

import '../../provider/skill_provider.dart';
import 'skill_card.dart';

class SkillsGrid extends StatelessWidget {
  const SkillsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SkillProvider>();

    int crossAxisCount = 5;

    if (Responsive.isTablet(context)) {
      crossAxisCount = 3;
    }

    if (Responsive.isMobile(context)) {
      crossAxisCount = 2;
    }

    return AnimationLimiter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
          childAspectRatio: 1.2,
        ),
        itemCount: provider.skills.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 600),
            columnCount: 3,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SkillsDetailsScreen(index: index),
                      ),
                    );
                    context.read<HomeProvider>().openSkills(index);
                  },
                  child: SkillCard(skill: provider.skills[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
