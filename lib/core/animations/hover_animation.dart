import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HoverScaleAnimation extends StatelessWidget {
  final Widget child;
  final int index;

  const HoverScaleAnimation({
    super.key,
    required this.child,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isHovered = context.select<MouseRegionProvider, bool>(
      (provider) => provider.isHovered(index),
    );

    return MouseRegion(
      onEnter: (_) {
        context.read<MouseRegionProvider>().setHover(index);
      },

      onExit: (_) {
        context.read<MouseRegionProvider>().clearHover(index);
      },
      child: AnimatedScale(
        scale: isHovered ? 1.04 : 1.0,
        duration: const Duration(milliseconds: 250),
        child: child,
      ),
    );
  }
}

class MouseRegionProvider extends ChangeNotifier {
  int? _hoveredIndex;

  int? get hoveredIndex => _hoveredIndex;

  bool isHovered(int index) {
    return _hoveredIndex == index;
  }

  void setHover(int index) {
    if (_hoveredIndex == index) return;

    _hoveredIndex = index;
    notifyListeners();
  }

  void clearHover(int index) {
    if (_hoveredIndex != index) return;

    _hoveredIndex = null;
    notifyListeners();
  }

  void clearAll() {
    if (_hoveredIndex == null) return;

    _hoveredIndex = null;
    notifyListeners();
  }
}
