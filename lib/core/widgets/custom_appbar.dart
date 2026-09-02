import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Widget customAppBar(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  return Container(
    height: width < 768 ? 75 : 90,
    padding: EdgeInsets.symmetric(horizontal: width < 768 ? 20 : 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: Image.asset(
            "assets/images/hassanlogo.png",
            height: width < 768 ? 42 : 50,
          ),
        ),
        whatsappButton(width),
      ],
    ),
  );
}

Widget whatsappButton(double width) {
  return InkWell(
    onTap: () async {
      const String businessPhoneNumber = '923453884988';

      const String message =
          'Hello Hassan Zamin, I would like to discuss a project or something with you.';

      final Uri whatsappUrl = Uri.https('wa.me', '/$businessPhoneNumber', {
        'text': message,
      });

      try {
        if (await canLaunchUrl(whatsappUrl)) {
          await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
        } else {
          debugPrint('Could not open WhatsApp.');
        }
      } catch (e) {
        debugPrint('WhatsApp error: $e');
      }
    },
    borderRadius: BorderRadius.circular(50),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.transparent, // Yellow background
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.amber),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(FontAwesomeIcons.whatsapp, color: Colors.amber),
          SizedBox(width: 8),
          Text(
            "Whatsapp",
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}
