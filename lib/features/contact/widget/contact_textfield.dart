import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hassanzamin/features/contact/provider/contact_textfield_provider.dart';
import 'package:provider/provider.dart';

class ContactTextField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final provider = context.watch<TextFieldsProvider>();
    final bool mobile = width < 768;
    final bool enableHover = kIsWeb || width >= 1200;

    final Color primary = const Color(0xff26224F);
    final Color accent = const Color(0xffFFD83D);

    return MouseRegion(
      onEnter: enableHover ? (_) => provider.setHover(true) : null,
      onExit: enableHover ? (_) => provider.setHover(false) : null,
      child: Focus(
        onFocusChange: provider.setFocused,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: provider.focused
                  ? accent
                  : provider.hover
                  ? primary.withValues(alpha: .25)
                  : Colors.grey.shade300,
              width: provider.focused ? 2 : 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: provider.focused
                    ? accent.withValues(alpha: .20)
                    : provider.hover
                    ? Colors.black.withValues(alpha: .06)
                    : Colors.black.withValues(alpha: .03),
                blurRadius: provider.focused ? 25 : 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
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
                vertical: maxLines == 1 ? (mobile ? 18 : 22) : 22,
              ),

              prefixIcon: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  color: provider.focused ? accent : primary,
                  size: mobile ? 22 : 24,
                ),
              ),

              hintText: hint,

              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500,
                fontSize: mobile ? 15 : 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
