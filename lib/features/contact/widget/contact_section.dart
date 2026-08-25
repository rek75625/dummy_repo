import 'package:flutter/material.dart';
import 'package:hassanzamin/core/constants/app_colors.dart';
import 'package:hassanzamin/features/contact/widget/background_contact.dart';
import 'package:hassanzamin/features/contact/widget/contact_form.dart';
import 'package:hassanzamin/features/contact/widget/contact_left_panel.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final bool mobile = size.width < 768;
    final bool tablet = size.width >= 768 && size.width < 1200;
    final bool desktop = size.width >= 1200;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: mobile
            ? 20
            : tablet
            ? 40
            : 70,
        vertical: mobile ? 60 : 90,
      ),
      decoration: BoxDecoration(color: AppColors.background),
      child: Stack(
        children: [
          /// Background Decorations
          const Positioned.fill(child: ContactBackground()),

          /// Main Content
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1450),
            child: desktop
                ? Container(
                    color: AppColors.background,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Expanded(flex: 5, child: ContactLeftPanel()),

                        SizedBox(width: 70),

                        Expanded(flex: 6, child: ContactForm()),
                      ],
                    ),
                  )
                : tablet
                ? Container(
                    color: AppColors.background,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(child: ContactLeftPanel()),

                        SizedBox(width: 40),

                        Expanded(child: ContactForm()),
                      ],
                    ),
                  )
                : Container(
                    color: AppColors.background,
                    child: Column(
                      children: const [
                        ContactLeftPanel(),

                        SizedBox(height: 50),

                        ContactForm(),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
