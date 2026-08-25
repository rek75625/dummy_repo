import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

        const SizedBox(width: 25),

        const Expanded(
          flex: 2,
          child: _FooterLinksColumn(
            title: 'Company',
            items: ['About', 'Portfolio', 'Trainings', 'Contact'],
          ),
        ),

        const SizedBox(width: 25),

        const Expanded(flex: 3, child: _ContactColumn()),
      ],
    );
  }
}

/* ============================================================
                          TABLET
============================================================ */

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
      children: const [
        _SocialButton(
          icon: FontAwesomeIcons.facebookF,
          color: Color(0xFF1877F2),
        ),

        _SocialButton(
          icon: FontAwesomeIcons.instagram,
          color: Color(0xFFE4405F),
        ),

        _SocialButton(icon: FontAwesomeIcons.tiktok, color: Colors.white),

        _SocialButton(icon: FontAwesomeIcons.youtube, color: Color(0xFFFF0000)),
      ],
    );
  }
}

/// ============================================================
/// SOCIAL BUTTON
/// ============================================================

class _SocialButton extends StatefulWidget {
  final FaIconData icon;
  final Color color;

  const _SocialButton({required this.icon, required this.color});

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        if (!kIsWeb) return;

        setState(() {
          _hovered = true;
        });
      },

      onExit: (_) {
        if (!kIsWeb) return;

        setState(() {
          _hovered = false;
        });
      },

      child: GestureDetector(
        onTap: () {
          // Add your social-media URL/action here.
        },

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,

          width: 46,
          height: 46,

          transform: Matrix4.translationValues(0, _hovered ? -5 : 0, 0),

          decoration: BoxDecoration(
            shape: BoxShape.circle,

            color: _hovered
                ? widget.color.withValues(alpha: 0.14)
                : Colors.white.withValues(alpha: 0.07),

            border: Border.all(
              width: 1,
              color: _hovered
                  ? widget.color.withValues(alpha: 0.45)
                  : Colors.white.withValues(alpha: 0.08),
            ),

            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: widget.color.withValues(alpha: 0.20),
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

          child: Center(
            child: FaIcon(widget.icon, size: 18, color: widget.color),
          ),
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

        ...items.map((item) => _FooterLink(title: item)),
      ],
    );
  }
}

/// ============================================================
/// FOOTER LINK
/// ============================================================

class _FooterLink extends StatefulWidget {
  final String title;

  const _FooterLink({required this.title});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        if (!kIsWeb) return;

        setState(() {
          _hovered = true;
        });
      },

      onExit: (_) {
        if (!kIsWeb) return;

        setState(() {
          _hovered = false;
        });
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

            transform: Matrix4.translationValues(_hovered ? 4 : 0, 0, 0),

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),

                  width: _hovered ? 8 : 0,
                  height: 2,

                  margin: EdgeInsets.only(right: _hovered ? 8 : 0),

                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC107),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                Text(
                  widget.title,
                  style: TextStyle(
                    color: _hovered ? const Color(0xFFFFC107) : Colors.white70,
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Contact',
          style: TextStyle(
            color: Color(0xFFF8F8FF),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 22),

        _ContactItem(
          icon: Icons.location_on_outlined,
          text: 'Islamabad Capital Territory, Pakistan',
        ),

        SizedBox(height: 17),

        _ContactItem(icon: Icons.phone_outlined, text: '+92 345 3884988'),

        SizedBox(height: 17),

        _ContactItem(
          icon: Icons.email_outlined,
          text: 'hassaanzamin@gmail.com',
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

  const _ContactItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFFFC107).withValues(alpha: .1),
          ),
          child: Icon(icon, color: const Color(0xFFFFC107), size: 17),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFFE3E1F0),
              fontSize: 14,
              height: 1.6,
              fontWeight: FontWeight.w600,
              letterSpacing: .7,
            ),
          ),
        ),
      ],
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
