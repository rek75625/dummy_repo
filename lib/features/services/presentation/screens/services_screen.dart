import 'package:flutter/material.dart';
import 'package:hassanzamin/features/services/presentation/screens/services_details_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/service_provider.dart';
import '../widgets/service_accordion.dart';
import '../widgets/service_image.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  static const Color background = Color(0xff1C1A45);
  static const Color yellow = Color(0xffffb800);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ServiceProvider(),
      child: const _ServiceScreenBody(),
    );
  }
}

class _ServiceScreenBody extends StatelessWidget {
  const _ServiceScreenBody();

  static const Color background = Color(0xff1C1A45);
  static const Color yellow = Color(0xffffb800);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width < 700) {
          return _mobile(context);
        }

        if (width < 1100) {
          return _tablet(context);
        }

        return _desktop(context);
      },
    );
  }

  // ============================================================
  // MOBILE
  // ============================================================

  Widget _mobile(BuildContext context) {
    return Container(
      width: double.infinity,
      color: background,
      padding: const EdgeInsets.fromLTRB(20, 65, 20, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading(context, eyebrow: 'LATEST SERVICES', fontSize: 34),

          SizedBox(height: 35),

          _mobileImage(context),

          SizedBox(height: 40),

          _serviceList(context),
        ],
      ),
    );
  }

  // ============================================================
  // TABLET
  // ============================================================

  Widget _tablet(BuildContext context) {
    return Container(
      width: double.infinity,
      color: background,
      padding: const EdgeInsets.fromLTRB(40, 80, 40, 90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading(context, eyebrow: 'LATEST SERVICES', fontSize: 45),

          const SizedBox(height: 45),

          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: ServicesImage(),
            ),
          ),

          const SizedBox(height: 50),

          _serviceList(context),
        ],
      ),
    );
  }

  // ============================================================
  // DESKTOP
  // ============================================================

  Widget _desktop(BuildContext context) {
    return Container(
      width: double.infinity,
      color: background,

      padding: const EdgeInsets.fromLTRB(60, 95, 60, 110),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1450),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 45,
                child: Padding(
                  padding: const EdgeInsets.only(right: 38),
                  child: _desktopImage(context),
                ),
              ),

              Expanded(
                flex: 55,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38),
                  child: _desktopServices(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // DESKTOP IMAGE
  // ============================================================

  Widget _desktopImage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _heading(
          context,
          eyebrow: 'LATEST SERVICES',
          fontSize: 18,
          compact: true,
        ),

        const SizedBox(height: 15),

        Text(
          'Helping Businesses\nGrow Faster',
          style: TextStyle(
            color: Colors.white,
            fontSize: _desktopHeadingSize(context),
            fontWeight: FontWeight.w800,
            height: 1.05,
            letterSpacing: -1.2,
          ),
        ),

        const SizedBox(height: 25),
        ServicesImage(),
        const SizedBox(height: 25),
        _imageCaption(context),
      ],
    );
  }

  // ============================================================
  // DESKTOP SERVICES
  // ============================================================

  Widget _desktopServices(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_serviceList(context)],
    );
  }

  // ============================================================
  // SERVICE LIST
  // ============================================================

  Widget _serviceList(BuildContext context) {
    final provider = context.watch<ServiceProvider>();

    return Column(
      children: List.generate(provider.services.length, (index) {
        final service = provider.services[index];

        return ServiceAccordion(
          service: service,
          expanded: provider.expandedIndex == index,
          onTap: () {
            provider.toggleService(index);
          },
        );
      }),
    );
  }

  // ============================================================
  // MOBILE IMAGE
  // ============================================================

  Widget _mobileImage(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: ServicesImage(),
      ),
    );
  }

  // ============================================================
  // HEADING
  // ============================================================

  Widget _heading(
    BuildContext context, {
    required String eyebrow,
    required double fontSize,
    bool compact = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: TextStyle(
            color: yellow,
            fontSize: compact ? 16 : 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.5,
          ),
        ),

        if (!compact) ...[
          const SizedBox(height: 12),

          Text(
            'Helping Businesses\nGrow Faster',
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w800,
              height: 1.08,
              letterSpacing: -1,
            ),
          ),
        ],
      ],
    );
  }

  // ============================================================
  // IMAGE CAPTION
  // ============================================================

  Widget _imageCaption(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ServicesDetailsScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
        ),
        child: const Row(
          children: [
            Expanded(
              child: Text(
                'Strategic training, practical knowledge '
                'and business-focused growth. So for more details please visit',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(width: 15),
            Icon(Icons.arrow_outward_rounded, color: yellow),
          ],
        ),
      ),
    );
  }

  double _desktopHeadingSize(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= 1500) {
      return 50;
    }

    if (width >= 1300) {
      return 52;
    }

    return 46;
  }
}
