import 'package:flutter/material.dart';

import '../model/portfolio_model.dart';

class PortfolioProvider extends ChangeNotifier {
  int selectedCategory = 0;

  final List<String> categories = const [
    'All',
    'Corporate',
    'Branding',
    'Training',
  ];

  final List<PortfoliosModel> items = const [
    // ============================================================
    // 01 - L'ORÉAL
    // ============================================================
    PortfoliosModel(
      title: "L'Oréal Retail Design Training",
      image: 'assets/images/aboutme.jpeg',
      category: 'Corporate',
      brand: "L'Oréal",
      h1: "Retail Design\nTraining",
      h2: "Building Retail Excellence Through Practical Training",
      h3: "HASSAN ZAMIN  •  RETAIL DESIGN & TRAINING",
      body:
          'A focused retail design training experience developed '
          'to strengthen in-store execution, visual merchandising, '
          'product presentation, and retail team capabilities. '
          'The session brought practical retail strategies into '
          'a collaborative learning environment, helping teams '
          'translate brand standards into measurable execution.',
      client: "L'Oréal",
      focus: "Retail Design & Merchandising",
      role: "Training & Retail Development",
      experience: "Practical Team-Based Learning",
      ctaText: "EXPLORE TRAINING",
      footerText: "Hassan Zamin  ·  Retail Design  ·  Training & Development",
      navigation: ["OVERVIEW", "TRAINING", "RETAIL DESIGN", "RESULTS"],
    ),

    // ============================================================
    // 02 - SHAN FOODS
    // ============================================================
    PortfoliosModel(
      title: "Shan Foods Merchandising Training",
      image: 'assets/images/aboutme.jpeg',
      category: 'Corporate',
      brand: "Shan Foods",
      h1: "Merchandising\nTraining",
      h2: "Strengthening Retail Execution Through Practical Learning",
      h3: "HASSAN ZAMIN  •  RETAIL DESIGN & TRAINING",
      body:
          'A practical merchandising training experience focused '
          'on strengthening retail execution, product visibility, '
          'merchandising standards, and team capabilities. '
          'The training environment connected practical retail '
          'knowledge with hands-on execution.',
      client: "Shan Foods",
      focus: "Merchandising & Retail Execution",
      role: "Training & Retail Development",
      experience: "Practical Team-Based Learning",
      ctaText: "EXPLORE TRAINING",
      footerText: "Hassan Zamin  ·  Merchandising  ·  Training & Development",
      navigation: ["OVERVIEW", "TRAINING", "MERCHANDISING", "RESULTS"],
    ),

    // ============================================================
    // 03 - FLORA
    // ============================================================
    PortfoliosModel(
      title: "Flora Launch Training",
      image: 'assets/images/aboutme.jpeg',
      category: 'Corporate',
      brand: "Flora",
      h1: "Launch\nTraining",
      h2: "Creating Stronger Retail Impact Through Practical Training",
      h3: "HASSAN ZAMIN  •  RETAIL DESIGN & TRAINING",
      body:
          'A focused launch training experience designed to support '
          'retail teams with practical execution, product presentation, '
          'merchandising, and customer-facing retail strategies. '
          'The session helped teams translate launch objectives '
          'into effective retail execution.',
      client: "Flora",
      focus: "Launch & Retail Execution",
      role: "Training & Retail Development",
      experience: "Practical Team-Based Learning",
      ctaText: "EXPLORE TRAINING",
      footerText: "Hassan Zamin  ·  Retail Design  ·  Training & Development",
      navigation: ["OVERVIEW", "TRAINING", "LAUNCH", "RESULTS"],
    ),

    // ============================================================
    // 04 - HILAL FOODS
    // ============================================================
    PortfoliosModel(
      title: "Hilal Foods Retail Merchandising Training",
      image: 'assets/images/aboutme.jpeg',
      category: 'Corporate',
      brand: "Hilal Foods",
      h1: "Retail Merchandising\nTraining",
      h2: "Building Stronger Retail Teams Through Practical Learning",
      h3: "HASSAN ZAMIN  •  RETAIL DESIGN & TRAINING",
      body:
          'A retail merchandising training experience focused on '
          'improving in-store execution, merchandising practices, '
          'product presentation, and retail team performance. '
          'The training connected practical strategies with '
          'real-world retail environments.',
      client: "Hilal Foods",
      focus: "Retail Merchandising",
      role: "Training & Retail Development",
      experience: "Practical Team-Based Learning",
      ctaText: "EXPLORE TRAINING",
      footerText:
          "Hassan Zamin  ·  Retail Merchandising  ·  Training & Development",
      navigation: ["OVERVIEW", "TRAINING", "MERCHANDISING", "RESULTS"],
    ),

    // ============================================================
    // 05 - MODERN TRADE
    // ============================================================
    PortfoliosModel(
      title: "Modern Trade Training",
      image: 'assets/images/aboutme.jpeg',
      category: 'Corporate',
      brand: "Modern Trade",
      h1: "Modern Trade\nTraining",
      h2: "Developing Practical Excellence in Modern Retail",
      h3: "HASSAN ZAMIN  •  RETAIL DESIGN & TRAINING",
      body:
          'A focused modern trade training experience developed '
          'to strengthen retail execution, team capabilities, '
          'product presentation, and practical merchandising '
          'knowledge within modern retail environments.',
      client: "Modern Trade",
      focus: "Modern Trade & Retail Execution",
      role: "Training & Retail Development",
      experience: "Practical Team-Based Learning",
      ctaText: "EXPLORE TRAINING",
      footerText: "Hassan Zamin  ·  Modern Trade  ·  Training & Development",
      navigation: ["OVERVIEW", "TRAINING", "MODERN TRADE", "RESULTS"],
    ),

    // ============================================================
    // 06 - RETAIL DESIGN
    // ============================================================
    PortfoliosModel(
      title: "Retail Design Mastery",
      image: 'assets/images/aboutme.jpeg',
      category: 'Corporate',
      brand: "Retail Design",
      h1: "Retail Design\nMastery",
      h2: "Turning Retail Design Principles Into Practical Execution",
      h3: "HASSAN ZAMIN  •  RETAIL DESIGN & TRAINING",
      body:
          'A practical retail design learning experience focused '
          'on improving visual presentation, merchandising execution, '
          'product visibility, and retail team capabilities. '
          'The training connected design thinking with practical '
          'in-store application.',
      client: "Retail Design",
      focus: "Retail Design & Merchandising",
      role: "Training & Retail Development",
      experience: "Practical Team-Based Learning",
      ctaText: "EXPLORE TRAINING",
      footerText: "Hassan Zamin  ·  Retail Design  ·  Training & Development",
      navigation: ["OVERVIEW", "TRAINING", "RETAIL DESIGN", "RESULTS"],
    ),

    // ============================================================
    // 07 - APP TRACKING
    // ============================================================
    PortfoliosModel(
      title: "App Tracking Training",
      image: 'assets/images/aboutme.jpeg',
      category: 'Corporate',
      brand: "App Tracking",
      h1: "App Tracking\nTraining",
      h2: "Improving Retail Visibility Through Practical Tracking",
      h3: "HASSAN ZAMIN  •  RETAIL DESIGN & TRAINING",
      body:
          'A practical training experience focused on app-based '
          'retail tracking, execution visibility, team adoption, '
          'and improved retail performance. The session introduced '
          'practical approaches for connecting retail activities '
          'with measurable execution.',
      client: "App Tracking",
      focus: "Retail Tracking & Execution",
      role: "Training & Retail Development",
      experience: "Practical Team-Based Learning",
      ctaText: "EXPLORE TRAINING",
      footerText: "Hassan Zamin  ·  Retail Tracking  ·  Training & Development",
      navigation: ["OVERVIEW", "TRAINING", "APP TRACKING", "RESULTS"],
    ),

    // ============================================================
    // 08 - RETAIL DESIGN
    // ============================================================
    PortfoliosModel(
      title: "Retail Design Mastery",
      image: 'assets/images/aboutme.jpeg',
      category: 'Corporate',
      brand: "Retail Design",
      h1: "Retail Design\nMastery",
      h2: "Building Stronger Retail Execution Through Design",
      h3: "HASSAN ZAMIN  •  RETAIL DESIGN & TRAINING",
      body:
          'A hands-on retail design training experience focused '
          'on practical merchandising, visual communication, '
          'product presentation, and stronger in-store execution. '
          'The training helped teams apply retail design principles '
          'within practical store environments.',
      client: "Retail Design",
      focus: "Retail Design & Merchandising",
      role: "Training & Retail Development",
      experience: "Practical Team-Based Learning",
      ctaText: "EXPLORE TRAINING",
      footerText: "Hassan Zamin  ·  Retail Design  ·  Training & Development",
      navigation: ["OVERVIEW", "TRAINING", "RETAIL DESIGN", "RESULTS"],
    ),
    // ============================================================
    // 09 - Skill21 Training
    // ============================================================
    PortfoliosModel(
      title: "Skills21 - Digital Learning",
      image: 'assets/images/aboutme.jpeg',
      category: 'Training',
      brand: "Skills21 - Digital Learning",

      h1: "Digital Education\n& Training",

      h2: "Better Skills, Better Opportunities, Brighter Future",

      h3: "HASSAN ZAMIN  •  EDUCATION CONSULTANT & TRAINING",

      body:
          'At Skills21, we specialize in digital education and '
          'professional training, helping individuals and businesses '
          'succeed in the modern digital landscape. Our approach focuses '
          'on practical learning, professional skills, digital knowledge, '
          'and meaningful opportunities that help learners build a '
          'stronger and more successful future.',

      client: "Skills21 - Digital Learning",

      focus: "Digital Education & Professional Training",

      role: "Education Consultant & Training",

      experience: "Practical Learning & Skills Development",

      ctaText: "EXPLORE TRAINING",

      footerText:
          "Hassan Zamin  ·  Education Consulting  ·  Digital Learning & Training",

      navigation: ["OVERVIEW", "TRAINING", "DIGITAL EDUCATION", "RESULTS"],
    ),

    // ============================================================
    // 10 - MightAims Training
    // ============================================================
    PortfoliosModel(
      title: "Mighty Aims Professional Training Center",
      image: 'assets/images/aboutme.jpeg',
      category: 'Training',

      brand: "Mighty Aims Communications LLP",

      h1: "Professional\nTraining Center",

      h2: "Practical Skills, Digital Learning & Professional Development",

      h3: "MIGHTY AIMS COMMUNICATIONS LLP  •  TRAINING & DIGITAL SOLUTIONS",

      body:
          'Mighty Aims Communications LLP provides professional training '
          'and digital learning opportunities focused on practical skills, '
          'professional development, and technology-driven business '
          'capabilities. The organization connects learning with practical '
          'digital and business environments, helping individuals develop '
          'skills relevant to modern professional work. Its areas of '
          'services and learning include digital marketing, web development, '
          'data processing, medical billing, software solutions, and other '
          'digital business services.',

      client: "Mighty Aims Communications LLP",

      focus: "Professional Training & Digital Education",

      role: "Training & Professional Development",

      experience: "Practical, Career-Oriented Learning",

      ctaText: "EXPLORE TRAINING",

      footerText:
          "12C, Sector-4A, Khayaba-e-Sir Syed, Rawalpindi (44000), Pakistan",

      navigation: [
        "OVERVIEW",
        "TRAINING",
        "DIGITAL EDUCATION",
        "DIGITAL SKILLS",
      ],
    ),
    // ============================================================
    // 11 - Inspire Education System Training
    // ============================================================
    PortfoliosModel(
      title: "Inspire Education & Skills Development",

      image: 'assets/images/aboutme.jpeg',

      category: 'Training',

      brand: "Inspire Education System",

      h1: "Inspire Education\n& Skills Development",

      h2: "Empowering Students Through Education, Practical Learning & Future-Ready Skills",

      h3: "INSPIRE EDUCATION SYSTEM  •  HIGH SCHOOL, ACADEMY & SKILLS INSTITUTION",

      body:
          'Inspire Education System is a school, academy, and skills development '
          'institution dedicated to creating meaningful learning experiences for '
          'students and learners. The institution promotes child-centered learning, '
          'play-based activities, a safe and nurturing learning environment, and '
          'development of cognitive, social, and emotional skills. '
          'Alongside academic education, the center focuses on practical knowledge, '
          'personal development, confidence building, and skills that help learners '
          'prepare for future academic and professional opportunities. '
          'Its learning environment is designed to support students from their '
          'early educational foundation through continued academic and skills development.',

      client: "Inspire Education System",

      focus: "School Education, Academy Programs & Skills Development",

      role: "Education, Training & Student Development",

      experience: "Child-Centered Learning, Academic Growth & Practical Skills",

      ctaText: "EXPLORE TRAINING",

      footerText:
          "Inspire Education System  ·  Education  ·  Skills Training  ·  Student Development",

      navigation: ["OVERVIEW", "EDUCATION", "SKILLS", "DEVELOPMENT", "RESULTS"],
    ),
  ];

  void changesCategory(int index) {
    if (index < 0 || index >= categories.length) {
      return;
    }

    selectedCategory = index;
    notifyListeners();
  }

  List<PortfoliosModel> get filteredItems {
    if (selectedCategory == 0) {
      return items;
    }

    final selected = categories[selectedCategory];

    return items
        .where((item) => item.category == selected)
        .toList(growable: false);
  }

  PortfoliosModel getItem(int index) {
    return items[index];
  }
}
