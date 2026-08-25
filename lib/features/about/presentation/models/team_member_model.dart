class TeamMember {
  final String image;
  final String name;
  final String designation;

  const TeamMember({
    required this.image,
    required this.name,
    required this.designation,
  });
}

final List<TeamMember> teamMembers = [
  TeamMember(
    image: "assets/images/team1.jpg",
    name: "Hassan Zamin",
    designation: "CEO & Founder",
  ),
  TeamMember(
    image: "assets/images/team2.jpg",
    name: "Ali Khan",
    designation: "Marketing Expert",
  ),
  TeamMember(
    image: "assets/images/team3.jpg",
    name: "Usman Ahmed",
    designation: "Graphic Designer",
  ),
  TeamMember(
    image: "assets/images/team4.jpg",
    name: "Sara Noor",
    designation: "Social Media Manager",
  ),
  TeamMember(
    image: "assets/images/team5.jpg",
    name: "Hamza",
    designation: "Video Editor",
  ),
  TeamMember(
    image: "assets/images/team6.jpg",
    name: "Fatima",
    designation: "Content Writer",
  ),
];
