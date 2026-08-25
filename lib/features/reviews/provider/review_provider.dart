import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import '../model/review_model.dart';

class ReviewProvider extends ChangeNotifier {
  final PageController pageController = PageController(viewportFraction: 0.92);

  int currentPage = 0;
  Timer? _autoSlider;

  final List<ReviewModel> reviews = const [
    ReviewModel(
      image: "assets/images/aboutme.jpeg",
      name: "Ali Hassan",
      company: "Hilal Foods",
      review:
          "Working with Hassan completely transformed our digital marketing. Sales increased dramatically within months.",
      rating: 5,
    ),

    ReviewModel(
      image: "assets/images/aboutme.jpeg",
      name: "Sarah Ahmed",
      company: "L'Oréal",
      review:
          "Professional, knowledgeable and highly recommended for performance marketing.",
      rating: 5,
    ),

    ReviewModel(
      image: "assets/images/aboutme.jpeg",
      name: "Usman Khan",
      company: "Blue Band",
      review:
          "Excellent mentor and consultant. We achieved exceptional business growth.",
      rating: 5,
    ),
    ReviewModel(
      image: "assets/images/aboutme.jpeg",
      name: "Ayesha Malik",
      company: "Nestlé Pakistan",
      review:
          "Hassan's strategic approach and deep understanding of digital marketing helped us achieve outstanding online engagement and measurable business growth.",
      rating: 5,
    ),

    ReviewModel(
      image: "assets/images/aboutme.jpeg",
      name: "Ahmed Raza",
      company: "Engro Corporation",
      review:
          "An exceptional consultant who provided practical solutions tailored to our business needs. His expertise significantly improved our digital presence.",
      rating: 5,
    ),

    ReviewModel(
      image: "assets/images/aboutme.jpeg",
      name: "Fatima Noor",
      company: "Systems Limited",
      review:
          "Working with Hassan was an outstanding experience. His innovative marketing strategies and professional guidance exceeded our expectations.",
      rating: 5,
    ),
  ];

  @override
  void dispose() {
    _autoSlider?.cancel();
    pageController.dispose();
    super.dispose();
  }

  ReviewProvider() {
    pageController.addListener(() {
      currentPage = pageController.page?.round() ?? 0;
      notifyListeners();
    });

    _startAutoSlider();
  }

  void _startAutoSlider() {
    _autoSlider = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!pageController.hasClients) return;

      if (currentPage < reviews.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      } else {
        pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void next() {
    if (currentPage < reviews.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void previous() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
