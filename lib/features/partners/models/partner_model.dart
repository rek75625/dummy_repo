class CompanysModel {
  final String name;
  final String logo;
  final String category;
  final String description;
  final String website;

  const CompanysModel({
    required this.name,
    required this.logo,
    required this.category,
    required this.description,
    required this.website,
  });
}

class CompanyData {
  static const List<CompanysModel> companies = [
    CompanysModel(
      name: "Hilal Foods",
      logo: "assets/companies/hilal.jpg",
      category: "FMCG & Food",
      description:
          "Hilal Foods is a Pakistani FMCG company operating across "
          "confectionery, bakery and other food categories.",
      website: "https://hilalfoods.com.pk/",
    ),

    CompanysModel(
      name: "Blue Band",
      logo: "assets/companies/blueband.jpeg",
      category: "Food & Nutrition",
      description:
          "Blue Band is a food and nutrition brand offering "
          "plant-based products for everyday consumption.",
      website: "https://www.blueband.com/en-pk/",
    ),

    CompanysModel(
      name: "Wall's",
      logo: "assets/companies/walls.png",
      category: "Ice Cream & Frozen Desserts",
      description:
          "Wall's is a well-known frozen dessert and ice cream brand "
          "marketed in Pakistan by Unilever Pakistan.",
      website: "https://www.unilever.pk/",
    ),

    CompanysModel(
      name: "L'Oréal Pakistan",
      logo: "assets/companies/loreal.png",
      category: "Beauty & Cosmetics",
      description:
          "L'Oréal is a global beauty company working across "
          "beauty, cosmetics, skincare and haircare.",
      website: "https://lorealpakistan.com/",
    ),

    CompanysModel(
      name: "MTJ",
      logo: "assets/companies/mtj.jpg",
      category: "Fashion & Lifestyle",
      description:
          "MTJ is a Pakistani fashion and lifestyle brand offering "
          "clothing collections and fragrances.",
      website: "https://mtjonline.com/",
    ),

    CompanysModel(
      name: "GSK Pakistan",
      logo: "assets/companies/gsk.jpg",
      category: "Healthcare & Pharmaceuticals",
      description:
          "GSK Pakistan is part of the global GSK biopharma organization, "
          "providing medicines and vaccines.",
      website: "https://pk.gsk.com/en-pk/",
    ),
  ];
}
