import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hassanzamin/features/contact/presentation/contact_details_screen.dart';
import 'package:hassanzamin/features/home/provider/home_provider.dart';
import 'package:url_launcher/url_launcher.dart';

Widget appBar(BuildContext context, HomeProvider provider) {
  final width = MediaQuery.of(context).size.width;

  final bool isMobile = width < 768;
  final bool isTablet = width >= 768 && width < 1200;
  // final bool isDesktop = width >= 1200;

  //=========================================================
  // Mobile & Tablet
  //=========================================================

  if (isMobile || isTablet) {
    return Builder(
      builder: (context) {
        return Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Image.asset("assets/images/hassanlogo.png", height: 45),

              const Spacer(),

              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white, size: 30),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  //=========================================================
  // Desktop
  //=========================================================

  return Container(
    height: 55,
    padding: EdgeInsets.symmetric(horizontal: 40),
    child: Row(
      children: [
        Image.asset("assets/images/hassanlogo.png", height: 45),

        Spacer(),

        Row(
          children: [
            _navButton("Home", provider.homeKey, provider),
            _navButton("About", provider.aboutKey, provider),
            _navButton("Services", provider.servicesKey, provider),
            _navButton("Portfolio", provider.portfolioKey, provider),
            _navButton("Partners", provider.partnersKey, provider),
            _navButton("Reviews", provider.reviewKey, provider),
            _navButton("Skills", provider.skillsKey, provider),
            ContactUsWidget(),
          ],
        ),
        const Spacer(),
        whatsappButton(provider),
      ],
    ),
  );
}

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed("contact");
      },
      child: Text(
        "Contact Us",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

Widget _navButton(String title, GlobalKey key, HomeProvider provider) {
  return TextButton(
    onPressed: () {
      provider.scrollToSection(key);
    },
    child: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Drawer mobileDrawer(BuildContext context, HomeProvider provider) {
  return Drawer(
    backgroundColor: const Color(0xff211E4B),
    child: SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 20),

          // =========================================================
          // LOGO
          // =========================================================
          Center(
            child: Image.asset("assets/images/hassanlogo.png", height: 55),
          ),

          const SizedBox(height: 25),

          Divider(
            color: Colors.white.withValues(alpha: .15),
            indent: 20,
            endIndent: 20,
          ),

          const SizedBox(height: 10),

          // =========================================================
          // MENU
          // =========================================================
          _drawerItem(
            context,
            "Home",
            Icons.home_rounded,
            provider.homeKey,
            provider,
          ),

          _drawerItem(
            context,
            "About",
            Icons.person_rounded,
            provider.aboutKey,
            provider,
          ),

          _drawerItem(
            context,
            "Services",
            Icons.design_services_rounded,
            provider.servicesKey,
            provider,
          ),

          _drawerItem(
            context,
            "Portfolio",
            Icons.work_rounded,
            provider.portfolioKey,
            provider,
          ),

          _drawerItem(
            context,
            "Partners",
            Icons.groups_rounded,
            provider.partnersKey,
            provider,
          ),

          _drawerItem(
            context,
            "Reviews",
            Icons.reviews_rounded,
            provider.reviewKey,
            provider,
          ),

          _drawerItem(
            context,
            "Skills",
            Icons.auto_awesome_rounded,
            provider.skillsKey,
            provider,
          ),

          // =========================================================
          // CONTACT US
          // =========================================================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                splashColor: Colors.amber.withValues(alpha: .15),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ContactDetailScreen()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      Icon(Icons.contact_mail_rounded, color: Colors.white),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(Icons.chevron_right_rounded, color: Colors.white54),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // =========================================================
          // WHATSAPP
          // =========================================================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Material(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(12),
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.black),
                title: const Text(
                  "Whatsapp",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.black,
                ),
                onTap: () async {
                  const String businessPhoneNumber = '923453884988';

                  const String message =
                      'Hello Hassan Zamin, I would like to discuss a project or something with you.';

                  final Uri whatsappUrl = Uri.https(
                    'wa.me',
                    '/$businessPhoneNumber',
                    {'text': message},
                  );

                  try {
                    if (await canLaunchUrl(whatsappUrl)) {
                      await launchUrl(
                        whatsappUrl,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      debugPrint('Could not open WhatsApp.');
                    }
                  } catch (e) {
                    debugPrint('WhatsApp error: $e');
                  }
                },
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}

Widget _drawerItem(
  BuildContext context,
  String title,
  IconData icon,
  GlobalKey key,
  HomeProvider provider,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
    child: Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.amber.withValues(alpha: .15),
        highlightColor: Colors.amber.withValues(alpha: .06),
        onTap: () {
          Navigator.pop(context);

          Future.delayed(const Duration(milliseconds: 250), () {
            provider.scrollToSection(key);
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 22),

              const SizedBox(width: 16),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const Icon(Icons.chevron_right_rounded, color: Colors.white38),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget whatsappButton(HomeProvider provider) {
  return InkWell(
    onTap: () async {
      const String businessPhoneNumber = '923453884988';

      const String message =
          'Hello Hassan Zamin, I would like to discuss a project or something with you.';

      final Uri whatsappUrl = Uri.https('wa.me', '/$businessPhoneNumber', {
        'text': message,
      });

      try {
        if (await canLaunchUrl(whatsappUrl)) {
          await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
        } else {
          debugPrint('Could not open WhatsApp.');
        }
      } catch (e) {
        debugPrint('WhatsApp error: $e');
      }
    },
    borderRadius: BorderRadius.circular(50),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.transparent, // Yellow background
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.amber),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(FontAwesomeIcons.whatsapp, color: Colors.amber),
          SizedBox(width: 8),
          Text(
            "Whatsapp",
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}
