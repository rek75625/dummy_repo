import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HoverScaleAnimation extends StatelessWidget {
  final Widget child;

  const HoverScaleAnimation({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // 1. Correct: 'watch' tells the UI to rebuild when the hover state changes
    final isHovered = context.watch<MouseRegionProvider>().hover;

    return MouseRegion(
      // 2. FIXED: Changed 'watch' to 'read' inside callbacks to prevent runtime crashes
      onEnter: (_) => context.read<MouseRegionProvider>().setHover(true),
      onExit: (_) => context.read<MouseRegionProvider>().setHover(false),
      child: AnimatedScale(
        scale: isHovered ? 1.04 : 1.0,
        duration: const Duration(milliseconds: 250),
        child: child,
      ),
    );
  }
}

class MouseRegionProvider with ChangeNotifier {
  bool _hover = false;

  bool get hover => _hover;

  void setHover(bool value) {
    if (_hover != value) {
      _hover = value;
      notifyListeners();
    }
  }
}
