import 'package:flutter/material.dart';

class SocialIconButton extends StatefulWidget {
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
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: hover
                ? Colors.amber.shade600
                : Colors.white.withValues(alpha: 0.10),
            shape: BoxShape.circle,
            boxShadow: hover
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
                color: hover ? widget.color : widget.color,
                size: 20,
              ),
              child: widget.icon,
            ),
          ),
        ),
      ),
    );
  }
}
