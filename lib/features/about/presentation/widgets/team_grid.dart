import 'package:flutter/material.dart';
import 'package:hassanzamin/features/about/presentation/models/team_member_model.dart';
import 'package:hassanzamin/features/about/presentation/widgets/team_card.dart';

class TeamGrid extends StatelessWidget {
  const TeamGrid({super.key});

  final List<TeamMember> members = const [
    TeamMember(
      image: "assets/images/male.jpg",
      name: "Hassan Zamin",
      designation: "CEO & Founder \n Digital Marketing Expert",
    ),
    TeamMember(
      image: "assets/images/female.jpg",
      name: "Fatima",
      designation: "Co-Founder, Accountant & Social Media Manager",
    ),
    TeamMember(
      image: "assets/images/male.jpg",
      name: "RahmatUllah",
      designation: "Teacher, General Manager & Mobile App Developer",
    ),
    TeamMember(
      image: "assets/images/male.jpg",
      name: "Ahmed",
      designation: "Social Media Manager & Content Creator",
    ),
    TeamMember(
      image: "assets/images/male.jpg",
      name: "Arsalan",
      designation: "Shopify Platform Expert, Social Media Manager",
    ),
    TeamMember(
      image: "assets/images/female.jpg",
      name: "Sibha",
      designation: "Social Media Influencer & Business Partner",
    ),
    TeamMember(
      image: "assets/images/female.jpg",
      name: "Maheen",
      designation: "Doctor, Event Manager & Business Partner",
    ),
    TeamMember(
      image: "assets/images/female.jpg",
      name: "Alina",
      designation: "Asistant Social Media Manager & Content Creator",
    ),
  ];

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
        return TeamCard(member: members[index]);
      },
    );
  }
}
