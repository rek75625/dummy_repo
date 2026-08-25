import 'package:flutter/material.dart';
import 'package:hassanzamin/core/constants/app_colors.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool mobile = width < 768;
    // final bool tablet = width >= 768 && width < 1200;

    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: Container(
          color: AppColors.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (mobile) ...[
                _field(controller: nameController, hint: "Your Name"),
                const SizedBox(height: 20),

                _field(controller: emailController, hint: "Your Email"),
              ] else
                Row(
                  children: [
                    Expanded(
                      child: _field(
                        controller: nameController,
                        hint: "Your Name",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _field(
                        controller: emailController,
                        hint: "Your Email",
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 20),

              if (mobile) ...[
                _field(controller: phoneController, hint: "Phone Number"),
                const SizedBox(height: 20),

                _field(controller: subjectController, hint: "Subject"),
              ] else
                Row(
                  children: [
                    Expanded(
                      child: _field(
                        controller: phoneController,
                        hint: "Phone Number",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _field(
                        controller: subjectController,
                        hint: "Subject",
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 20),

              _field(
                controller: messageController,
                hint: "Your Message",
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,

        filled: true,
        fillColor: AppColors.background,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 22,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),

        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xffFFD83D), width: 2),
        ),
      ),
    );
  }
}
