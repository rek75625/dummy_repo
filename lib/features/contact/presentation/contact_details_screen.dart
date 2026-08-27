import 'package:flutter/material.dart';
import 'package:hassanzamin/core/widgets/custom_appbar.dart';
import 'package:hassanzamin/features/contact/widget/contact_section.dart';
import 'package:hassanzamin/features/footer/presentation/screens/footer_section.dart';
import 'package:hassanzamin/features/footer/presentation/screens/newsletter_section.dart';
import 'package:hassanzamin/routes/back_to_home.dart';

class ContactDetailsScreen extends StatelessWidget {
  const ContactDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool mobile = width < 768;

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
                                "Why choose us?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: titleSize,
                                ),
                              ),
                              SizedBox(height: isMobile ? 15 : 25),
                              CustomBackToHome(title: "Contact"),
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
            ContactSection(),
            mobile
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _info(Icons.phone, "+92 345 3884988"),
                        const SizedBox(height: 20),

                        _info(Icons.email, "hassaanzamin@gmail.com"),
                        const SizedBox(height: 20),

                        _info(
                          Icons.location_on,
                          "Islamabad Capital Territory, Pakistan",
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: _info(Icons.phone, "+92 345 3884988")),

                        const SizedBox(width: 10),

                        Expanded(
                          child: _info(Icons.email, "hassaanzamin@gmail.com"),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: _info(
                            Icons.location_on,
                            "Islamabad Capital Territory, Pakistan",
                          ),
                        ),
                      ],
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

  Widget _info(IconData icon, String value) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xffFFD83D),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: const Color(0xff26224F)),
        ),

        const SizedBox(width: 18),

        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
