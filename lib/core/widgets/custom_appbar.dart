import 'package:flutter/material.dart';
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
            "assets/images/hassanlogo.jpg",
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
    borderRadius: BorderRadius.circular(50),
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
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: width < 768 ? 14 : 18,
        vertical: width < 768 ? 8 : 10,
      ),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.phone, color: Colors.black, size: width < 768 ? 18 : 20),
          SizedBox(width: width < 768 ? 6 : 8),
          Text(
            "Whatsapp",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: width < 768 ? 13 : 15,
            ),
          ),
        ],
      ),
    ),
  );
}
