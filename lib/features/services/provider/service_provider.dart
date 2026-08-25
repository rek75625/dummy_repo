import 'package:flutter/material.dart';

class ServiceModel {
  final String number;
  final String title;
  final String description;

  const ServiceModel({
    required this.number,
    required this.title,
    required this.description,
  });
}

class ServiceProvider extends ChangeNotifier {
  int _expandedIndex = 1;

  int get expandedIndex => _expandedIndex;

  int selectedIndex = 0;

  final List<ServiceModel> services = const [
    ServiceModel(
      number: "01",
      title: "Performance Marketing",
      description:
          "Meta Ads, Google Ads and data-driven campaigns that maximize ROI and business growth.",
    ),
    ServiceModel(
      number: "02",
      title: "Brand Growth Strategy",
      description:
          "Building memorable brands with positioning, messaging and digital identity.",
    ),
    ServiceModel(
      number: "03",
      title: "Lead Generation",
      description:
          "Generate qualified leads through funnels, landing pages and automation.",
    ),

    ServiceModel(
      number: "04",
      title: "Digital Education",
      description:
          "Empowering individuals and businesses with digital marketing knowledge.",
    ),
    ServiceModel(
      number: '05',
      title: 'Client Acquisition Strategy',
      description:
          'Use proven outreach methods, nurturing flows and sales processes '
          'to consistently acquire high-value clients online.',
    ),
    ServiceModel(
      number: '06',
      title: 'Mentorship & Business Consulting',
      description:
          'Get expert guidance, practical plans and personalized advice '
          'to solve challenges and grow faster with confidence.',
    ),
  ];

  void toggleService(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = -1;
    } else {
      _expandedIndex = index;
    }

    notifyListeners();
  }
}
