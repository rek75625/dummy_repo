import 'package:flutter/material.dart';

import '../../model/portfolio_model.dart';

class PortfolioCard extends StatefulWidget {
  final PortfolioModel portfolio;
  final int index;
  final VoidCallback? onTap;

  const PortfolioCard({
    super.key,
    required this.portfolio,
    required this.index,
    this.onTap,
  });

  @override
  State<PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  bool _hovered = false;

  PortfolioModel get portfolio => widget.portfolio;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        setState(() {
          _hovered = true;
        });
      },

      onExit: (_) {
        setState(() {
          _hovered = false;
        });
      },

      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,

          transform: Matrix4.translationValues(0, _hovered ? -8 : 0, 0),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _hovered ? 0.20 : 0.12),
                blurRadius: _hovered ? 30 : 18,
                offset: Offset(0, _hovered ? 18 : 10),
              ),
            ],
          ),

          clipBehavior: Clip.antiAlias,

          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                portfolio.image,
                fit: BoxFit.cover,

                errorBuilder: (context, error, stackTrace) {
                  return const ColoredBox(
                    color: Color(0xffeeeeee),
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 45,
                        color: Colors.black45,
                      ),
                    ),
                  );
                },
              ),

              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: _hovered ? 0.75 : 0.55),
                    ],
                  ),
                ),
              ),

              Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      portfolio.brand,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Text(
                      portfolio.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        height: 1.1,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      portfolio.category,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: .8),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 18,
                right: 18,
                child: AnimatedScale(
                  scale: _hovered ? 1.1 : 1,
                  duration: const Duration(milliseconds: 250),
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .92),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_outward_rounded,
                      size: 20,
                      color: Colors.black,
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
