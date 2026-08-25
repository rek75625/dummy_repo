class PortfolioModel {
  final String title;
  final String image;
  final String category;

  // Details
  final String brand;
  final String h1;
  final String h2;
  final String h3;
  final String body;

  // Supporting information
  final String client;
  final String focus;
  final String role;
  final String experience;

  // CTA
  final String ctaText;

  // Footer
  final String footerText;

  // Navigation
  final List<String> navigation;

  const PortfolioModel({
    required this.title,
    required this.image,
    required this.category,
    required this.brand,
    required this.h1,
    required this.h2,
    required this.h3,
    required this.body,
    required this.client,
    required this.focus,
    required this.role,
    required this.experience,
    required this.ctaText,
    required this.footerText,
    required this.navigation,
  });
}
