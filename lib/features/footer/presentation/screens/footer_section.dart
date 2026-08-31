import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:hassanzamin/features/footer/provider/footer_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final bool mobile = width < 700;
        final bool tablet = width >= 700 && width < 1150;

        return Container(
          width: double.infinity,
          color: AppColors.background,
          child: Stack(
            children: [
              const _FooterBackground(),

              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1500),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mobile
                          ? 20
                          : tablet
                          ? 40
                          : 70,
                      vertical: mobile
                          ? 55
                          : tablet
                          ? 65
                          : 80,
                    ),
                    child: Column(
                      children: [
                        if (mobile)
                          const _MobileFooterContent()
                        else if (tablet)
                          const _TabletFooterContent()
                        else
                          const _DesktopFooterContent(),

                        SizedBox(
                          height: mobile
                              ? 45
                              : tablet
                              ? 55
                              : 70,
                        ),

                        _FooterDivider(),

                        SizedBox(height: 22),

                        _Copyright(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/* ============================================================
                        BACKGROUND
============================================================ */

class _FooterBackground extends StatelessWidget {
  const _FooterBackground();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -180,
              right: -150,
              child: Container(
                width: 420,
                height: 420,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFFC107).withValues(alpha: .055),
                ),
              ),
            ),

            Positioned(
              bottom: -200,
              left: -160,
              child: Container(
                width: 450,
                height: 450,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withValues(alpha: .045),
                ),
              ),
            ),

            Positioned.fill(
              child: CustomPaint(painter: _FooterPatternPainter()),
            ),
          ],
        ),
      ),
    );
  }
}

/* ============================================================
                     BACKGROUND PATTERN
============================================================ */

class _FooterPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: .025)
      ..strokeWidth = 1;

    const spacing = 45.0;

    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/* ============================================================
                         DESKTOP
============================================================ */

class _DesktopFooterContent extends StatelessWidget {
  const _DesktopFooterContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 5,
          child: _BrandSection(
            alignment: CrossAxisAlignment.start,
            textAlign: TextAlign.left,
          ),
        ),

        const SizedBox(width: 80),

        const Expanded(
          flex: 2,
          child: _FooterLinksColumn(
            title: 'Services',
            items: ['Marketing', 'Consulting', 'Mentorship', 'Lead Generation'],
          ),
        ),

        const SizedBox(width: 10),

        const Expanded(
          flex: 2,
          child: _FooterLinksColumn(
            title: 'Company',
            items: ['About', 'Portfolio', 'Trainings', 'Contact'],
          ),
        ),

        const SizedBox(width: 10),

        const Expanded(flex: 3, child: _ContactColumn()),
      ],
    );
  }
}

/* ============================================================
                          TABLET
============================================================*/

class _TabletFooterContent extends StatelessWidget {
  const _TabletFooterContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _BrandSection(
          alignment: CrossAxisAlignment.center,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 60),

        LayoutBuilder(
          builder: (context, constraints) {
            return Wrap(
              spacing: 30,
              runSpacing: 45,
              alignment: WrapAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: (constraints.maxWidth - 60) / 3,
                  child: const _FooterLinksColumn(
                    title: 'Services',
                    items: [
                      'Marketing',
                      'Consulting',
                      'Mentorship',
                      'Lead Generation',
                    ],
                  ),
                ),

                SizedBox(
                  width: (constraints.maxWidth - 60) / 3,
                  child: const _FooterLinksColumn(
                    title: 'Company',
                    items: ['About', 'Portfolio', 'Trainings', 'Contact'],
                  ),
                ),

                SizedBox(
                  width: (constraints.maxWidth - 60) / 3,
                  child: const _ContactColumn(),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

/* ============================================================
                           MOBILE
============================================================ */

class _MobileFooterContent extends StatelessWidget {
  const _MobileFooterContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _BrandSection(
          alignment: CrossAxisAlignment.center,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 50),

        _MobileSectionCard(
          child: const _FooterLinksColumn(
            title: 'Services',
            items: ['Marketing', 'Consulting', 'Mentorship', 'Lead Generation'],
          ),
        ),

        const SizedBox(height: 18),

        _MobileSectionCard(
          child: const _FooterLinksColumn(
            title: 'Company',
            items: ['About', 'Portfolio', 'Trainings', 'Contact'],
          ),
        ),

        const SizedBox(height: 18),

        _MobileSectionCard(child: const _ContactColumn()),
      ],
    );
  }
}

/* ============================================================
                        BRAND SECTION
============================================================ */

class _BrandSection extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final TextAlign textAlign;

  const _BrandSection({required this.alignment, required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        _Logo(),
        const SizedBox(height: 25),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Text(
            'Helping businesses grow through digital marketing '
            'and strategic consulting.',
            textAlign: textAlign,
            style: const TextStyle(
              color: Color(0xFFAAA7C4),
              fontSize: 16,
              height: 1.8,
              fontWeight: FontWeight.w500,
              letterSpacing: .2,
            ),
          ),
        ),

        const SizedBox(height: 28),

        const _SocialButtons(),
      ],
    );
  }
}

/* ============================================================
                             LOGO
============================================================ */

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withValues(alpha: .025),
      ),
      child: Image.asset(
        'assets/images/hassanlogo.jpg',
        height: 68,
        fit: BoxFit.contain,
      ),
    );
  }
}

/* ============================================================
                       SOCIAL BUTTONS
============================================================ */

class _SocialButtons extends StatelessWidget {
  const _SocialButtons();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _SocialButton(
          icon: FontAwesomeIcons.facebookF,
          color: Color(0xFF1877F2),
          index: 11,
          onTap: () async {
            openSocialMedia(
              'https://web.facebook.com/hassandigitalmarketingservices',
            );
          },
        ),

        _SocialButton(
          icon: FontAwesomeIcons.instagram,
          color: Color(0xFFE4405F),
          index: 22,
          onTap: () async {
            openSocialMedia(
              'https://www.instagram.com/hassaandigitalmarketing',
            );
          },
        ),

        _SocialButton(
          icon: FontAwesomeIcons.tiktok,
          color: Colors.black,
          index: 33,
          onTap: () async {
            openSocialMedia(
              'https://www.tiktok.com/@hassandigitalteam?is_from_webapp=1&sender_device=pc',
            );
          },
        ),

        _SocialButton(
          icon: FontAwesomeIcons.youtube,
          color: Color(0xFFFF0000),
          index: 44,
          onTap: () async {
            openSocialMedia(
              'https://www.youtube.com/@Digitalmarektingservices',
            );
          },
        ),
      ],
    );
  }
}

/// ============================================================
/// SOCIAL BUTTON
/// ============================================================

class _SocialButton extends StatelessWidget {
  final FaIconData icon;
  final Color color;
  final int index;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.color,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isHovered = context.select<MouseRegionProvider, bool>(
      (provider) => provider.isHovered(index),
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        context.read<MouseRegionProvider>().setHover(index);
      },

      onExit: (_) {
        context.read<MouseRegionProvider>().clearHover(index);
      },

      child: GestureDetector(
        onTap: onTap,

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,

          width: 46,
          height: 46,

          transform: Matrix4.translationValues(0, isHovered ? -5 : 0, 0),

          decoration: BoxDecoration(
            shape: BoxShape.circle,

            color: isHovered
                ? color.withValues(alpha: 0.14)
                : Colors.white.withValues(alpha: 0.07),

            border: Border.all(
              width: 1,
              color: isHovered
                  ? color.withValues(alpha: 0.45)
                  : Colors.white.withValues(alpha: 0.08),
            ),

            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: color.withValues(alpha: 0.20),
                      blurRadius: 20,
                      spreadRadius: 1,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 8,
                    ),
                  ],
          ),

          child: Center(child: FaIcon(icon, size: 18, color: color)),
        ),
      ),
    );
  }
}

/// ============================================================
/// FOOTER LINKS COLUMN
/// ============================================================

class _FooterLinksColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const _FooterLinksColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final int startIndex = title == 'Services' ? 0 : 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFF8F8FF),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
          ),
        ),

        const SizedBox(height: 22),

        for (int index = 0; index < items.length; index++)
          _FooterLink(
            item: items[index],
            index: startIndex + index,
            title: title,
          ),
      ],
    );
  }
}

/// ============================================================
/// FOOTER LINK
/// ============================================================

class _FooterLink extends StatelessWidget {
  final String item;
  final int index;
  final String title;

  const _FooterLink({
    required this.item,
    required this.index,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isHovered = context.select<MouseRegionProvider, bool>(
      (provider) => provider.isHovered(index),
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        context.read<MouseRegionProvider>().setHover(index);
      },

      onExit: (_) {
        context.read<MouseRegionProvider>().clearHover(index);
      },

      child: GestureDetector(
        onTap: () {
          // Add navigation/action here.
        },

        child: Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,

            transform: Matrix4.translationValues(isHovered ? 4 : 0, 0, 0),

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),

                  width: isHovered ? 8 : 0,
                  height: 2,

                  margin: EdgeInsets.only(right: isHovered ? 8 : 0),

                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC107),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                Text(
                  item,
                  style: TextStyle(
                    color: isHovered ? const Color(0xFFFFC107) : Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* ============================================================
                       CONTACT COLUMN
============================================================ */

class _ContactColumn extends StatelessWidget {
  const _ContactColumn();

  Future<void> _openLocation() async {
    final Uri location = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=I-8+Islamabad+Pakistan',
    );

    if (await canLaunchUrl(location)) {
      await launchUrl(location, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _callPhone() async {
    final Uri phone = Uri(scheme: 'tel', path: '+923453884988');

    if (await canLaunchUrl(phone)) {
      await launchUrl(phone);
    }
  }

  Future<void> _sendEmail() async {
    final Uri email = Uri(
      scheme: 'mailto',
      path: 'hassaanzamin@gmail.com',
      queryParameters: {'subject': 'Contact from Website'},
    );

    if (await canLaunchUrl(email)) {
      await launchUrl(email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact',
          style: TextStyle(
            color: Color(0xFFF8F8FF),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 22),

        // LOCATION
        _ContactItem(
          icon: Icons.location_on_outlined,
          text: 'I-8 Islamabad, Pakistan',
          onTap: _openLocation,
        ),

        const SizedBox(height: 17),

        // PHONE
        _ContactItem(
          icon: Icons.phone_outlined,
          text: '+92 345 3884988',
          onTap: _callPhone,
        ),

        const SizedBox(height: 17),

        // EMAIL
        _ContactItem(
          icon: Icons.email_outlined,
          text: 'hassaanzamin@gmail.com',
          onTap: _sendEmail,
        ),
      ],
    );
  }
}

/* ============================================================
                       CONTACT ITEM
============================================================ */

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _ContactItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFFFC107).withValues(alpha: .1),
      ),
      child: TextButton.icon(
        icon: Icon(icon, color: const Color(0xFFFFC107), size: 17),
        label: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFE3E1F0),
            fontSize: 14,
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

/* ============================================================
                     MOBILE SECTION CARD
============================================================ */

class _MobileSectionCard extends StatelessWidget {
  final Widget child;

  const _MobileSectionCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF282457).withValues(alpha: .75),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: .06)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .08),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}

/* ============================================================
                         DIVIDER
============================================================ */

class _FooterDivider extends StatelessWidget {
  const _FooterDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.white.withValues(alpha: .12),
    );
  }
}

/* ============================================================
                         COPYRIGHT
============================================================ */

class _Copyright extends StatelessWidget {
  const _Copyright();

  @override
  Widget build(BuildContext context) {
    return Text(
      '© 2026 Hassan Zamin. All Rights Reserved.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white.withValues(alpha: .5),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: .3,
      ),
    );
  }
}
