import 'package:flutter/material.dart';
import 'package:hassanzamin/core/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsForm extends StatefulWidget {
  const ContactsForm({super.key});

  @override
  State<ContactsForm> createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {
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
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  iconAlignment: IconAlignment.end,
                  onPressed: () async {
                    await sendFormToWhatsApp(
                      nameController: nameController,
                      emailController: emailController,
                      phoneController: phoneController,
                      subjectController: subjectController,
                      messageController: messageController,
                    );
                  },
                  label: Text("Send"),
                  icon: Icon(Icons.send),
                ),
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

Future<void> sendFormToWhatsApp({
  required TextEditingController nameController,
  required TextEditingController emailController,
  required TextEditingController phoneController,
  required TextEditingController subjectController,
  required TextEditingController messageController,
}) async {
  const String businessPhoneNumber = '923453884988';

  final String formattedText =
      '''
New Lead From App:

Name: ${nameController.text.trim()}
Email: ${emailController.text.trim()}
Phone No: ${phoneController.text.trim()}
Subject: ${subjectController.text.trim()}

Message:
${messageController.text.trim()}
''';

  final Uri whatsappUrl = Uri.https('wa.me', '/$businessPhoneNumber', {
    'text': formattedText,
  });

  try {
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch WhatsApp.');
    }
  } catch (e) {
    debugPrint('WhatsApp launch error: $e');
  }
}
