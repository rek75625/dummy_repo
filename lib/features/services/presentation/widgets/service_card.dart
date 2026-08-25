import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../provider/service_provider.dart';

class ServiceCard extends StatelessWidget {
  final int index;

  const ServiceCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ServiceProvider>();

    final service = provider.services[index];

    final selected = provider.selectedIndex == index;

    final width = MediaQuery.of(context).size.width;

    final bool desktop = width >= 1200;
    final bool tablet = width >= 768 && width < 1200;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => provider.expandedIndex == index
            ? provider.selectedIndex = -1
            : provider.selectedIndex = index,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          margin: EdgeInsets.only(
            bottom: desktop
                ? 20
                : tablet
                ? 18
                : 14,
          ),
          padding: EdgeInsets.all(
            desktop
                ? 28
                : tablet
                ? 22
                : 16,
          ),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.yellow
                : Colors.white.withValues(alpha: .05),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: selected ? AppColors.yellow : Colors.white10,
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Top Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    service.number,
                    style: TextStyle(
                      color: selected ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: desktop
                          ? 28
                          : tablet
                          ? 24
                          : 18,
                    ),
                  ),

                  SizedBox(
                    width: desktop
                        ? 20
                        : tablet
                        ? 15
                        : 10,
                  ),

                  Expanded(
                    child: Text(
                      service.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: desktop
                            ? 22
                            : tablet
                            ? 19
                            : 16,
                        fontWeight: FontWeight.bold,
                        color: selected ? Colors.black : Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(width: 8),

                  AnimatedRotation(
                    turns: selected ? .5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: desktop
                          ? 28
                          : tablet
                          ? 24
                          : 20,
                      color: selected ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),

              AnimatedCrossFade(
                duration: const Duration(milliseconds: 350),
                crossFadeState: selected
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,

                firstChild: const SizedBox.shrink(),

                secondChild: Padding(
                  padding: EdgeInsets.only(
                    top: desktop
                        ? 25
                        : tablet
                        ? 18
                        : 14,
                  ),
                  child: Text(
                    service.description,
                    style: TextStyle(
                      fontSize: desktop
                          ? 16
                          : tablet
                          ? 15
                          : 14,
                      height: 1.7,
                      color: selected ? Colors.black87 : Colors.white70,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
