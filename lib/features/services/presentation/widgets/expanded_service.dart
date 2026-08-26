import 'package:flutter/material.dart';
import 'package:hassanzamin/features/services/presentation/screens/services_details_screen.dart';

import 'package:hassanzamin/features/services/service_model.dart';

class ExpandedService extends StatelessWidget {
  final ServiceItem service;

  const ExpandedService({super.key, required this.service});

  static const Color navy = Color(0xff242052);
  static const Color yellow = Color(0xffffd238);
  static const Color textColor = Color(0xff575475);
  static const Color chipColor = Color(0xffebeaf4);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        /*
        ------------------------------------------------------------
        RESPONSIVE BREAKPOINT
        ------------------------------------------------------------
        If the available width is small, stack the image and content.
        This prevents the right-side Column from becoming too narrow.
        */

        final bool compact = width < 700;

        if (compact) {
          return _buildCompact(context);
        }

        return _buildDesktop(context);
      },
    );
  }

  // ============================================================
  // DESKTOP / TABLET
  // ============================================================

  Widget _buildDesktop(BuildContext context) {
    return Row(
      key: const ValueKey('expanded-desktop'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 34,
          child: AspectRatio(
            aspectRatio: 1.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(service.image, fit: BoxFit.cover),
            ),
          ),
        ),

        const SizedBox(width: 26),

        Expanded(flex: 66, child: _buildInformation(context)),
      ],
    );
  }

  // ============================================================
  // MOBILE / SMALL TABLET
  // ============================================================

  Widget _buildCompact(BuildContext context) {
    return Column(
      key: const ValueKey('expanded-mobile'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              service.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 18),

        _buildInformation(context),
      ],
    );
  }

  // ============================================================
  // INFORMATION
  // ============================================================

  Widget _buildInformation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),

        const SizedBox(height: 12),

        Text(
          service.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: textColor, fontSize: 14, height: 1.45),
        ),

        const SizedBox(height: 15),

        _buildPoints(),

        const SizedBox(height: 20),

        _buildBottom(context),
      ],
    );
  }

  // ============================================================
  // TITLE
  // ============================================================

  Widget _buildTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: yellow,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(service.icon, color: navy, size: 23),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Text(
            service.title.toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: navy,
              fontSize: 23,
              fontWeight: FontWeight.w800,
              letterSpacing: .5,
              height: 1.1,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // POINTS
  // ============================================================

  Widget _buildPoints() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: service.points.map((point) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
          decoration: BoxDecoration(
            color: chipColor,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_rounded,
                size: 15,
                color: Color(0xffffc800),
              ),

              const SizedBox(width: 5),

              Text(
                point,
                style: const TextStyle(
                  color: Color(0xff292454),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ============================================================
  // BOTTOM
  // ============================================================

  Widget _buildBottom(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Metric(value: service.metricOne, label: service.metricOneLabel),

        const SizedBox(width: 28),

        Metric(value: service.metricTwo, label: service.metricTwoLabel),

        const Spacer(),

        _buildExploreButton(context),
      ],
    );
  }

  // ============================================================
  // EXPLORE BUTTON
  // ===========================================================

  Widget _buildExploreButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ServicesDetailsScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
        decoration: BoxDecoration(
          color: const Color(0xffffc928),
          borderRadius: BorderRadius.circular(13),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'EXPLORE',
              style: TextStyle(
                color: navy,
                fontWeight: FontWeight.w800,
                fontSize: 12,
                letterSpacing: 1,
              ),
            ),

            SizedBox(width: 8),

            Icon(Icons.arrow_forward_rounded, color: navy, size: 17),
          ],
        ),
      ),
    );
  }
}

// ================================================================
// METRIC
// ================================================================

class Metric extends StatelessWidget {
  final String value;
  final String label;

  const Metric({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xff242052),
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 2),

        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color(0xff77738f),
            fontSize: 9,
            fontWeight: FontWeight.w600,
            letterSpacing: .5,
          ),
        ),
      ],
    );
  }
}
