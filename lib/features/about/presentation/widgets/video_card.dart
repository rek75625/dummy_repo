import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:provider/provider.dart';

class VideoCard extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String duration;
  final VoidCallback onTap;

  const VideoCard({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.duration,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isHovered = context.watch<MouseRegionProvider>().hover;

    final bool mobile = width < 768;
    final bool tablet = width >= 768 && width < 1200;
    final bool desktop = width >= 1200;

    final bool enableHover = desktop || kIsWeb;

    final double playSize = mobile
        ? 70
        : tablet
        ? 85
        : 95;

    final double iconSize = mobile
        ? 40
        : tablet
        ? 48
        : 55;

    final double radius = mobile ? 18 : 22;

    return MouseRegion(
      onEnter: enableHover
          ? (_) => context.read<MouseRegionProvider>().setHover(true)
          : null,
      onExit: enableHover
          ? (_) => context.read<MouseRegionProvider>().setHover(false)
          : null,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 250),
        scale: isHovered ? 1.02 : 1,
        child: GestureDetector(
          onTap: onTap,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(radius),
                boxShadow: [
                  BoxShadow(
                    blurRadius: isHovered ? 30 : 15,
                    color: Colors.black26,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 300),
                      scale: isHovered ? 1.05 : 1,
                      child: Image.asset(thumbnail, fit: BoxFit.cover),
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withValues(alpha: .20),
                    ),
                  ),

                  CameraOverlay(mobile: mobile, tablet: tablet),

                  Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: isHovered ? playSize + 10 : playSize,
                      height: isHovered ? playSize + 10 : playSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: .20),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: iconSize,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(mobile ? 16 : 22),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black87, Colors.transparent],
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: mobile
                                    ? 18
                                    : tablet
                                    ? 22
                                    : 26,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: mobile ? 10 : 14,
                              vertical: mobile ? 6 : 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              duration,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: mobile ? 12 : 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CameraOverlay extends StatelessWidget {
  final bool mobile;
  final bool tablet;

  const CameraOverlay({super.key, required this.mobile, required this.tablet});

  @override
  Widget build(BuildContext context) {
    final double padding = mobile ? 14 : 22;
    final double corner = mobile ? 28 : 45;
    final double border = mobile ? 2 : 3;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Text(
              "REC",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: mobile ? 14 : 22,
              ),
            ),
          ),

          Positioned(
            right: 0,
            top: 0,
            child: Icon(
              Icons.battery_full,
              color: Colors.white,
              size: mobile ? 24 : 34,
            ),
          ),

          _corner(Alignment.topLeft, corner, border),
          _corner(Alignment.topRight, corner, border),
          _corner(Alignment.bottomLeft, corner, border),
          _corner(Alignment.bottomRight, corner, border),
        ],
      ),
    );
  }

  Widget _corner(Alignment alignment, double size, double border) {
    return Align(
      alignment: alignment,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border(
            top:
                alignment == Alignment.topLeft ||
                    alignment == Alignment.topRight
                ? BorderSide(color: Colors.white, width: border)
                : BorderSide.none,
            bottom:
                alignment == Alignment.bottomLeft ||
                    alignment == Alignment.bottomRight
                ? BorderSide(color: Colors.white, width: border)
                : BorderSide.none,
            left:
                alignment == Alignment.topLeft ||
                    alignment == Alignment.bottomLeft
                ? BorderSide(color: Colors.white, width: border)
                : BorderSide.none,
            right:
                alignment == Alignment.topRight ||
                    alignment == Alignment.bottomRight
                ? BorderSide(color: Colors.white, width: border)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
