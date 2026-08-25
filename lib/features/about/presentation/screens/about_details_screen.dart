import 'package:flutter/material.dart';
import 'package:hassanzamin/core/widgets/custom_appbar.dart';
import 'package:hassanzamin/features/about/presentation/screens/about_screen.dart';
import 'package:hassanzamin/features/about/presentation/screens/video_player_screen.dart';
import 'package:hassanzamin/features/about/presentation/widgets/team_grid.dart';
import 'package:hassanzamin/features/about/presentation/widgets/video_card.dart';
import 'package:hassanzamin/features/footer/presentation/screens/footer_section.dart';
import 'package:hassanzamin/features/footer/presentation/screens/newsletter_section.dart';
import 'package:hassanzamin/routes/back_to_home.dart';

class AboutDetailsScreen extends StatelessWidget {
  const AboutDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(context),
            LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final bool isMobile = width < 768;
                final bool isTablet = width >= 768 && width < 1200;
                final bool isDesktop = width >= 1200;
                final double heroHeight = isDesktop
                    ? 400
                    : isTablet
                    ? 350
                    : 250;
                final double glassWidth = isDesktop
                    ? width * .65
                    : isTablet
                    ? width * .70
                    : width * .70;
                final double glassPadding = isDesktop
                    ? 30
                    : isTablet
                    ? 16
                    : 10;
                final double titleSize = isDesktop
                    ? 50
                    : isTablet
                    ? 35
                    : 26;
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: isMobile ? 15 : 30),
                  height: heroHeight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      /// Background Image
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/aboutus.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      /// Glass Card
                      Center(
                        child: Container(
                          width: glassWidth,
                          padding: EdgeInsets.symmetric(
                            horizontal: glassPadding,
                            vertical: glassPadding,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: .25),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: .35),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /// Title
                              Text(
                                "Digital Growth Experts",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: titleSize,
                                ),
                              ),
                              SizedBox(height: isMobile ? 15 : 25),
                              CustomBackToHome(
                                title: "About Us",
                                onPressed: () {},
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            AboutScreen(isDetails: false),
            SizedBox(height: 20),
            VideoCard(
              thumbnail: "assets/images/aboutyoutube.jpeg",
              title: "Hassan Zamin",
              duration: "11:45",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VideoPlayerScreen(
                      videoId: "xuF6TlAQCO0",
                      title: "Hassan Zamin The Digital Marketing Expert",
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 60),
            Column(
              children: [
                Text(
                  "Meet Our Team",
                  style: TextStyle(
                    color: Colors.amber.shade600,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  "Professional Team Behind Our Success",
                  style: TextStyle(fontSize: 18),
                ),

                SizedBox(height: 50),

                TeamGrid(),
              ],
            ),

            NewsletterSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
