import 'package:flutter/material.dart';
import 'package:hassanzamin/core/widgets/custom_appbar.dart';
import 'package:hassanzamin/features/contact/widget/contact_section.dart';
import 'package:hassanzamin/features/footer/presentation/screens/footer_section.dart';
import 'package:hassanzamin/features/footer/presentation/screens/newsletter_section.dart';
import 'package:hassanzamin/features/footer/provider/footer_provider.dart';
import 'package:hassanzamin/routes/back_to_home.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen({super.key});
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

            ContactSection(),
            mobile
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _info(Icons.phone, "+92 345 3884988", () async {
                          final Uri phone = Uri(
                            scheme: 'tel',
                            path: '+923453884988',
                          );

                          if (await canLaunchUrl(phone)) {
                            await launchUrl(phone);
                          }
                        }),

                        const SizedBox(height: 20),

                        _info(Icons.email, "hassaanzamin@gmail.com", () async {
                          final Uri email = Uri(
                            scheme: 'mailto',
                            path: 'info@hassanzamin.com',
                          );

                          if (await canLaunchUrl(email)) {
                            await launchUrl(email);
                          }
                        }),

                        const SizedBox(height: 20),

                        _info(
                          Icons.location_on,
                          "I-8 Islamabad, Pakistan",
                          () async {
                            final Uri location = Uri.https(
                              'www.google.com',
                              '/maps/search/',
                              {'api': '1', 'query': 'I-8 Islamabad Pakistan'},
                            );

                            if (await canLaunchUrl(location)) {
                              await launchUrl(
                                location,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _info(
                            Icons.phone,
                            "+92 345 3884988",
                            () async {
                              final Uri phone = Uri(
                                scheme: 'tel',
                                path: '+923453884988',
                              );

                              if (await canLaunchUrl(phone)) {
                                await launchUrl(phone);
                              }
                            },
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: _info(
                            Icons.email,
                            "hassaanzamin@gmail.com",
                            () => sendEmail(),
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: _info(
                            Icons.location_on,
                            "I-8 Islamabad, Pakistan",
                            () async {
                              final Uri location = Uri.https(
                                'www.google.com',
                                '/maps/search/',
                                {'api': '1', 'query': 'I-8 Islamabad Pakistan'},
                              );

                              if (await canLaunchUrl(location)) {
                                await launchUrl(
                                  location,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
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

  Widget _info(IconData icon, String value, VoidCallback onTap) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFFFC107).withValues(alpha: .1),
      ),
      child: TextButton.icon(
        icon: Icon(icon, color: const Color(0xFFFFC107), size: 25),
        label: Text(
          value,
          style: const TextStyle(
            color: Color(0xFFE3E1F0),
            fontSize: 16,
            height: 1.6,
            fontWeight: FontWeight.w600,
            letterSpacing: .7,
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
