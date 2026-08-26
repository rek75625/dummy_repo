import 'package:flutter/material.dart';
import 'package:hassanzamin/features/services/service_model.dart';

class CollapsedService extends StatelessWidget {
  final ServiceItem service;

  const CollapsedService({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final bool isMobile = width < 700;

    return Row(
      key: const ValueKey('collapsed'),
      children: [
        Container(
          width: isMobile ? 58 : 70,
          height: isMobile ? 58 : 70,
          decoration: BoxDecoration(
            color: const Color(0xffffd238),
            borderRadius: BorderRadius.circular(isMobile ? 15 : 18),
          ),
          child: Icon(
            service.icon,
            color: const Color(0xff252052),
            size: isMobile ? 27 : 32,
          ),
        ),

        SizedBox(width: isMobile ? 14 : 22),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                service.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 17 : 21,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                service.shortDescription,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: const Color(0xffb9b6d0),
                  fontSize: isMobile ? 12 : 15,
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: isMobile ? 8 : 20),

        Icon(
          Icons.arrow_forward_rounded,
          color: const Color(0xffaaa7c2),
          size: isMobile ? 20 : 24,
        ),
      ],
    );
  }
}
