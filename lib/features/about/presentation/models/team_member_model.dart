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
    designation: "Teacher, Education Manager & Digital Marketer",
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
