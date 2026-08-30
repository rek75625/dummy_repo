import 'package:flutter/material.dart';
import 'package:hassanzamin/features/partners/provider/partner_provider.dart';

import 'package:hassanzamin/features/services/presentation/widgets/collapsed_service.dart';
import 'package:hassanzamin/features/services/presentation/widgets/expanded_service.dart';
import 'package:hassanzamin/features/services/service_model.dart';
import 'package:provider/provider.dart';

class ServicesHoverCards extends StatelessWidget {
  final ServicesItem service;
  final int index;

  const ServicesHoverCards({
    super.key,
    required this.service,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isHovered = context.select<MouseRegionForPartnerProvider, bool>(
      (provider) => provider.isHovered(index),
    );
    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) =>
          context.read<MouseRegionForPartnerProvider>().setHover(index),
      onExit: (_) =>
          context.read<MouseRegionForPartnerProvider>().setHover(index),

      child: GestureDetector(
        onTap: () {
          final provider = context.read<ServiceCardHoverProvider>();

          provider.setHover(!provider.isHovered);
        },

        child: AnimatedSize(
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeOutCubic,
          alignment: Alignment.topCenter,

          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),

            padding: EdgeInsets.all(isHovered ? 20 : 26),

            decoration: BoxDecoration(
              color: isHovered
                  ? const Color(0xffF7F7F8)
                  : const Color(0xff242052),

              borderRadius: BorderRadius.circular(26),

              border: Border.all(
                color: isHovered ? const Color(0xffffcc33) : Colors.white70,
                width: 1.3,
              ),

              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .20),
                        blurRadius: 30,
                        offset: const Offset(0, 15),
                      ),
                    ]
                  : null,
            ),

            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,

              layoutBuilder:
                  (Widget? currentChild, List<Widget> previousChildren) {
                    return currentChild ?? const SizedBox.shrink();
                  },

              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },

              child: isHovered
                  ? ExpandedService(
                      key: const ValueKey('expanded-service'),
                      service: service,
                      index: index,
                    )
                  : CollapsedService(
                      key: const ValueKey('collapsed-service'),
                      service: service,
                      index: index,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceCardHoverProvider with ChangeNotifier {
  bool _isHovered = false;

  bool get isHovered => _isHovered;

  void setHover(bool value) {
    if (_isHovered == value) {
      return;
    }
    _isHovered = value;
    notifyListeners();
  }
}
