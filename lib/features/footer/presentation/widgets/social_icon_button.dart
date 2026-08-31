import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocialIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final Color color;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SocialIconButtonProvider>();

    return MouseRegion(
      onEnter: (_) => provider.setHover(true),
      onExit: (_) => provider.setHover(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: provider.hover
                ? Colors.amber.shade600
                : Colors.white.withValues(alpha: 0.10),
            shape: BoxShape.circle,
            boxShadow: provider.hover
                ? [
                    BoxShadow(
                      color: Colors.yellow.withValues(alpha: 0.35),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: IconTheme(
              data: IconThemeData(
                color: provider.hover ? color : color,
                size: 20,
              ),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}

class SocialIconButtonProvider extends ChangeNotifier {
  bool _hover = false;

  bool get hover => _hover;

  void setHover(bool value) {
    if (_hover == value) return;

    _hover = value;
    notifyListeners();
  }
}
