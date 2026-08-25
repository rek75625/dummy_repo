import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ContactTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final int maxLines;
  final TextInputType keyboardType;

  const ContactTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<ContactTextField> createState() => _ContactTextFieldState();
}

class _ContactTextFieldState extends State<ContactTextField> {
  bool hover = false;
  bool focused = false;

  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();

    focusNode.addListener(() {
      if (mounted) {
        setState(() {
          focused = focusNode.hasFocus;
        });
      }
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool mobile = width < 768;
    final bool enableHover = kIsWeb || width >= 1200;

    final Color primary = const Color(0xff26224F);
    final Color accent = const Color(0xffFFD83D);

    return MouseRegion(
      onEnter: enableHover ? (_) => setState(() => hover = true) : null,
      onExit: enableHover ? (_) => setState(() => hover = false) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: focused
                ? accent
                : hover
                ? primary.withValues(alpha: .25)
                : Colors.grey.shade300,
            width: focused ? 2 : 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: focused
                  ? accent.withValues(alpha: .20)
                  : hover
                  ? Colors.black.withValues(alpha: .06)
                  : Colors.black.withValues(alpha: .03),
              blurRadius: focused ? 25 : 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: TextField(
          controller: widget.controller,
          focusNode: focusNode,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          cursorColor: primary,
          style: TextStyle(
            color: primary,
            fontSize: mobile ? 15 : 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,

            contentPadding: EdgeInsets.symmetric(
              horizontal: mobile ? 18 : 22,
              vertical: widget.maxLines == 1 ? (mobile ? 18 : 22) : 22,
            ),

            prefixIcon: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              alignment: Alignment.center,
              child: Icon(
                widget.icon,
                color: focused ? accent : primary,
                size: mobile ? 22 : 24,
              ),
            ),

            hintText: widget.hint,

            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
              fontSize: mobile ? 15 : 16,
            ),
          ),
        ),
      ),
    );
  }
}
