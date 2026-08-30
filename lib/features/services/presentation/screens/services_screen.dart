import 'package:flutter/material.dart';
import 'package:hassanzamin/features/services/presentation/widgets/service_card_hover.dart';
import 'package:hassanzamin/features/services/service_model.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
          child: _headings(context),
        ),

        Container(
          color: Colors.transparent,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            itemBuilder: (context, index) {
              return ServicesHoverCards(service: services[index], index: index);
            },
          ),
        ),
        SizedBox(height: 80),
      ],
    );
  }
  // ============================================================
  // RESPONSIVE HEADING
  // MOBILE / TABLET / DESKTOP / LARGE WEBSITE
  // ============================================================

  Widget _headings(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1150;
    final bool isDesktop = width >= 1150;

    double eyebrowSize;
    double titleSize;
    double titleMaxWidth;
    double spacing;

    if (isMobile) {
      eyebrowSize = 13;
      titleSize = 34;
      titleMaxWidth = width - 40;
      spacing = 10;
    } else if (isTablet) {
      eyebrowSize = 15;
      titleSize = 42;
      titleMaxWidth = 600;
      spacing = 12;
    } else if (isDesktop) {
      eyebrowSize = 17;
      titleSize = width >= 1500 ? 46 : 40;
      titleMaxWidth = 1000;
      spacing = 14;
    } else {
      eyebrowSize = 16;
      titleSize = 46;
      titleMaxWidth = 1000;
      spacing = 14;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // --------------------------------------------------------
        // EYEBROW
        // --------------------------------------------------------

        Text(
          'LATEST SERVICES',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.amber,
            fontSize: eyebrowSize,
            fontWeight: FontWeight.w800,
            letterSpacing: isMobile ? 1.8 : 2.5,
            height: 1,
          ),
        ),

        SizedBox(height: spacing),

        // --------------------------------------------------------
        // MAIN HEADING
        // --------------------------------------------------------
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: titleMaxWidth),
          child: Text(
            'Helping Businesses Grow Faster',
            softWrap: true,
            style: TextStyle(
              color: Colors.white,
              fontSize: titleSize,
              fontWeight: FontWeight.w800,
              height: 1.2,
              letterSpacing: isMobile ? -0.8 : -1.3,
            ),
          ),
        ),
      ],
    );
  }
}
