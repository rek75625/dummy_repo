import 'package:flutter/material.dart';

class ServicesItem {
  final String title;
  final String shortDescription;
  final String description;
  final String image;
  final IconData icon;
  final List<String> points;
  final String metricOne;
  final String metricOneLabel;
  final String metricTwo;
  final String metricTwoLabel;

  const ServicesItem({
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.image,
    required this.icon,
    required this.points,
    required this.metricOne,
    required this.metricOneLabel,
    required this.metricTwo,
    required this.metricTwoLabel,
  });
}

final List<ServicesItem> services = [
  ServicesItem(
    title: 'Performance Marketing',
    shortDescription:
        'Meta Ads, Google Ads and data-driven campaigns that maximize ROI and business growth.',
    description:
        'Build measurable campaigns focused on clicks, leads, conversions and revenue. Track performance in real time and continuously optimize campaigns for stronger ROI.',
    image: 'assets/images/aboutme.jpeg',
    icon: Icons.campaign_rounded,
    points: [
      'Google Ads',
      'Meta Ads',
      'Conversion Tracking',
      'ROI Optimization',
    ],
    metricOne: '32%',
    metricOneLabel: 'LOWER CPA',
    metricTwo: '4.2x',
    metricTwoLabel: 'ROAS',
  ),

  ServicesItem(
    title: 'Brand Growth Strategy',
    shortDescription:
        'Building memorable brands with positioning, messaging and digital identity.',
    description:
        'Create a stronger market position through clear brand strategy, customer-focused messaging and a consistent digital identity.',
    image: 'assets/images/aboutme.jpeg',
    icon: Icons.auto_awesome_rounded,
    points: [
      'Brand Positioning',
      'Market Strategy',
      'Digital Identity',
      'Growth Planning',
    ],
    metricOne: '86%',
    metricOneLabel: 'BRAND GROWTH',
    metricTwo: '4.2x',
    metricTwoLabel: 'IMPACT',
  ),

  ServicesItem(
    title: 'Lead Generation',
    shortDescription:
        'Generate qualified leads through funnels, landing pages and automation.',
    description:
        'Build focused acquisition systems that attract qualified prospects, capture their information and move them toward conversion.',
    image: 'assets/images/aboutme.jpeg',
    icon: Icons.bar_chart_rounded,
    points: [
      'Lead Funnels',
      'Landing Pages',
      'Lead Qualification',
      'Automation',
    ],
    metricOne: '68%',
    metricOneLabel: 'MORE LEADS',
    metricTwo: '3.8x',
    metricTwoLabel: 'CONVERSION',
  ),

  ServicesItem(
    title: 'Digital Education',
    shortDescription:
        'Empowering individuals and businesses with digital marketing knowledge.',
    description:
        'Practical training designed to help teams understand digital marketing, performance measurement and modern growth strategies.',
    image: 'assets/images/aboutme.jpeg',
    icon: Icons.school_rounded,
    points: [
      'Digital Marketing',
      'Practical Training',
      'Team Workshops',
      'Strategy Education',
    ],
    metricOne: '250+',
    metricOneLabel: 'PROJECTS',
    metricTwo: '15+',
    metricTwoLabel: 'YEARS',
  ),
  ServicesItem(
    title: 'Client Acquisition Strategy',
    shortDescription:
        'Build predictable client acquisition systems that turn prospects into valuable customers.',
    description:
        'Develop a structured acquisition strategy using targeted campaigns, customer journeys and optimized touchpoints to consistently attract and convert high-value clients.',
    image: 'assets/images/aboutme.jpeg',
    icon: Icons.person_add_alt_1_rounded,
    points: [
      'Customer Acquisition',
      'Target Audience',
      'Sales Funnels',
      'Acquisition Strategy',
    ],
    metricOne: '45%',
    metricOneLabel: 'MORE CLIENTS',
    metricTwo: '3.6x',
    metricTwoLabel: 'ACQUISITION',
  ),

  ServicesItem(
    title: 'Mentorship & Business Consulting',
    shortDescription:
        'Strategic guidance for businesses, professionals and teams focused on sustainable growth.',
    description:
        'Provide practical mentorship and business consulting to identify growth opportunities, solve strategic challenges and build stronger systems for long-term success.',
    image: 'assets/images/aboutme.jpeg',
    icon: Icons.psychology_rounded,
    points: [
      'Business Strategy',
      'Growth Consulting',
      'Leadership Mentorship',
      'Strategic Planning',
    ],
    metricOne: '15+',
    metricOneLabel: 'YEARS EXPERIENCE',
    metricTwo: '250+',
    metricTwoLabel: 'PROJECTS',
  ),

  ServicesItem(
    title: 'Social Media Management',
    shortDescription:
        'Build engaging social media presence through strategic content, campaigns and community growth.',
    description:
        'Create and manage social media strategies that strengthen brand visibility, engage audiences and turn social platforms into meaningful business growth channels.',
    image: 'assets/images/aboutme.jpeg',
    icon: Icons.share_rounded,
    points: [
      'Content Strategy',
      'Social Campaigns',
      'Community Growth',
      'Performance Analytics',
    ],
    metricOne: '72%',
    metricOneLabel: 'MORE ENGAGEMENT',
    metricTwo: '3.2x',
    metricTwoLabel: 'REACH',
  ),

  ServicesItem(
    title: 'Conversion Optimization',
    shortDescription:
        'Turn more visitors and leads into customers through data-driven conversion optimization.',
    description:
        'Analyze customer journeys, landing pages and conversion funnels to remove friction, improve user experience and increase the percentage of visitors who become customers.',
    image: 'assets/images/aboutme.jpeg',
    icon: Icons.trending_up_rounded,
    points: [
      'Conversion Funnels',
      'Landing Page Optimization',
      'A/B Testing',
      'Analytics & Insights',
    ],
    metricOne: '38%',
    metricOneLabel: 'HIGHER CONVERSION',
    metricTwo: '4.1x',
    metricTwoLabel: 'ROI',
  ),
];

class SelectServicesProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectService(int index) {
    if (_selectedIndex == index) return;

    _selectedIndex = index;
    notifyListeners();
  }
}
