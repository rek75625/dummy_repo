import 'package:flutter/material.dart';
import 'package:hassanzamin/repositories/responsive.dart';

import '../widgets/about_content.dart';
import '../widgets/about_image.dart';

class AboutScreen extends StatelessWidget {
  final bool isDetails;
  const AboutScreen({super.key, required this.isDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isDesktop(context)
            ? 50
            : Responsive.isTablet(context)
            ? 30
            : 35,
        vertical: Responsive.isDesktop(context) ? 40 : 40,
      ),
      child: Responsive.isDesktop(context)
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: AboutsImages()),
                SizedBox(width: 20),
                Expanded(child: AboutContents(only: isDetails)),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AboutsImages(),
                SizedBox(height: 50),
                AboutContents(only: isDetails),
              ],
            ),
    );
  }
}
