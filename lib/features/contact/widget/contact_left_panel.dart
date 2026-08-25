import 'package:flutter/material.dart';
import 'package:hassanzamin/core/constants/app_colors.dart';
import 'package:hassanzamin/features/contact/presentation/model/feature_card.dart';

class ContactLeftPanel extends StatelessWidget {
  const ContactLeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool mobile = width < 768;
    final bool tablet = width >= 768 && width < 1200;

    return Container(
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //--------------------------------------------------
          // Small Title
          //--------------------------------------------------
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              "GET IN TOUCH",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 28),

          //--------------------------------------------------
          // Heading
          //--------------------------------------------------
          Text(
            "Let's Build\nSomething Amazing\nTogether.",
            style: TextStyle(
              height: 1.1,
              fontSize: mobile
                  ? 38
                  : tablet
                  ? 48
                  : 62,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 22),

          Container(
            width: 110,
            height: 6,
            decoration: BoxDecoration(
              color: const Color(0xffFFD83D),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          const SizedBox(height: 30),

          Text(
            "Whether you need personal branding, a powerful growth strategy "
            "or a complete digital marketing strategy, I'd love to hear about "
            "your project.",
            style: TextStyle(
              color: Colors.grey,
              fontSize: mobile ? 16 : 18,
              height: 1.8,
            ),
          ),

          const SizedBox(height: 40),

          //--------------------------------------------------
          // Feature Cards
          //--------------------------------------------------
          const FeatureCard(
            icon: Icons.campaign_rounded,
            title: "Digital Marketing",
            subtitle:
                "Social Media Management • Personal Branding • Digital Strategy ",
          ),
          const SizedBox(height: 18),
          const FeatureCard(
            icon: Icons.rocket_launch_rounded,
            title: "Data Driven Growth",
            subtitle:
                "Clean & scalable Network connectivity • Data Analytics • Growth Hacking",
          ),

          const SizedBox(height: 18),

          const FeatureCard(
            icon: Icons.phone_android_rounded,
            title: "Google Ecosystem Experties",
            subtitle:
                "Productivity • Services • Advertising • Analytics and more",
          ),

          const SizedBox(height: 40),

          //--------------------------------------------------
          // Contact Info
          //--------------------------------------------------
        ],
      ),
    );
  }
}
