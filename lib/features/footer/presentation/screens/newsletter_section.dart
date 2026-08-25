import 'package:flutter/material.dart';

import '../widgets/newsletter_form.dart';

class NewsletterSection extends StatelessWidget {
  const NewsletterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFB300),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 90, vertical: 80),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Subscribe To Newsletter",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  "Get marketing insights and business growth strategies directly in your inbox.",
                  style: TextStyle(color: Colors.black87, height: 1.6),
                ),
              ],
            ),
          ),

          const SizedBox(width: 60),

          const Expanded(child: NewsletterForm()),
        ],
      ),
    );
  }
}
