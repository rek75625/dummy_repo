import 'package:flutter/material.dart';
import 'package:hassanzamin/features/services/provider/service_provider.dart';

class ServiceAccordion extends StatefulWidget {
  final ServiceModel service;
  final bool expanded;
  final VoidCallback onTap;

  const ServiceAccordion({
    super.key,
    required this.service,
    required this.expanded,
    required this.onTap,
  });

  @override
  State<ServiceAccordion> createState() => _ServiceAccordionState();
}

class _ServiceAccordionState extends State<ServiceAccordion> {
  bool _hovered = false;

  static const Color cardColor = Color(0xff292651);
  static const Color yellow = Color(0xffffb800);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final bool mobile = width < 600;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _hovered = true);
      },
      onExit: (_) {
        setState(() => _hovered = false);
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
          margin: EdgeInsets.only(bottom: mobile ? 16 : 20),
          padding: EdgeInsets.symmetric(
            horizontal: mobile ? 22 : 28,
            vertical: widget.expanded
                ? mobile
                      ? 22
                      : 28
                : mobile
                ? 21
                : 25,
          ),
          decoration: BoxDecoration(
            color: widget.expanded
                ? yellow
                : _hovered
                ? const Color(0xff302d5c)
                : cardColor,
            borderRadius: BorderRadius.circular(widget.expanded ? 28 : 24),
            border: Border.all(
              color: widget.expanded
                  ? yellow
                  : Colors.white.withValues(alpha: 0.12),
              width: 1,
            ),
            boxShadow: widget.expanded
                ? [
                    BoxShadow(
                      color: yellow.withValues(alpha: 0.16),
                      blurRadius: 25,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : [],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      color: widget.expanded ? Colors.black : Colors.white,
                      fontSize: mobile ? 25 : 28,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                    child: Text(widget.service.number),
                  ),

                  SizedBox(width: mobile ? 18 : 22),

                  Expanded(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                        color: widget.expanded ? Colors.black : Colors.white,
                        fontSize: mobile ? 18 : 22,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                      child: Text(
                        widget.service.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  AnimatedRotation(
                    turns: widget.expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: mobile ? 25 : 28,
                      color: widget.expanded ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),

              AnimatedSize(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutCubic,
                child: widget.expanded
                    ? Padding(
                        padding: EdgeInsets.only(
                          top: mobile ? 18 : 22,
                          left: mobile ? 0 : 0,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.service.description,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: mobile ? 15 : 16,
                              height: 1.65,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
