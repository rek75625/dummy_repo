import 'package:flutter/material.dart';
import 'package:hassanzamin/features/about/presentation/models/team_member_model.dart';
import 'package:hassanzamin/features/about/presentation/widgets/team_card.dart';

class TeamGrid extends StatelessWidget {
  const TeamGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount = 4;

    if (width < 650) {
      crossAxisCount = 1;
    } else if (width < 950) {
      crossAxisCount = 2;
    } else if (width < 1300) {
      crossAxisCount = 3;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: members.length,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 28,
        mainAxisSpacing: 28,
        childAspectRatio: .73,
      ),
      itemBuilder: (_, index) {
        return TeamCards(member: members[index], index: index);
      },
    );
  }
}
