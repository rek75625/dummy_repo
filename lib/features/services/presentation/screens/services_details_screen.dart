import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hassanzamin/core/constants/app_colors.dart';
import 'package:hassanzamin/core/widgets/custom_appbar.dart';
import 'package:hassanzamin/features/footer/presentation/screens/footer_section.dart';
import 'package:hassanzamin/features/footer/presentation/screens/newsletter_section.dart';
import 'package:hassanzamin/features/services/presentation/widgets/service_card_hover.dart';
import 'package:hassanzamin/features/services/service_model.dart';
import 'package:hassanzamin/routes/back_to_home.dart';

class ServicesDetailsScreen extends StatefulWidget {
  const ServicesDetailsScreen({super.key});

  @override
  State<ServicesDetailsScreen> createState() => _ServicesDetailsScreenState();
}

class _ServicesDetailsScreenState extends State<ServicesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.background,

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
                                "data.title",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: titleSize,
                                ),
                              ),
                              SizedBox(height: isMobile ? 15 : 25),
                              CustomBackToHome(
                                title: "data.category",
                                onPressed: () {
                                  if (context.canPop()) {
                                    context.pop();
                                  } else {
                                    context.go('/');
                                  }
                                },
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
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return ServiceHoverCards(service: services[index]);
                },
              ),
            ),

            SizedBox(height: 50),
            NewsletterSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
