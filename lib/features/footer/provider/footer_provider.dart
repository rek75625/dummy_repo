import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();

  bool loading = false;

  Future<void> subscribe() async {
    if (emailController.text.isEmpty) return;
    sendFormToWhatsApp(emailController: emailController);
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    loading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}

class SocialButtonProvider extends ChangeNotifier {
  bool _hovered = false;

  bool get hovered => _hovered;

  void setHovered(bool value) {
    if (_hovered == value) return;

    _hovered = value;
    notifyListeners();
  }
}

///////////////////////////////////////////
/// email launch function
//////////////////////////////////////////

Future<void> sendFormToWhatsApp({
  required TextEditingController emailController,
}) async {
  const String businessPhoneNumber = '923453884988';

  final String formattedText =
      "New Email: ${emailController.text.trim()} Has been Subscribed to the News Letter ";

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

///////////////////////////////////////////
/// Social media and email launch function
//////////////////////////////////////////

Future<void> openSocialMedia(String url) async {
  final Uri socialUrl = Uri.parse(url);

  if (await canLaunchUrl(socialUrl)) {
    await launchUrl(socialUrl, mode: LaunchMode.externalApplication);
  }
}

Future<void> sendEmail() async {
  const String emailAddress = 'info@hassanzamin.com';
  const String subject = 'Contact from Website';

  // ----------------------------------------------------------
  // FLUTTER WEB
  // ----------------------------------------------------------
  if (kIsWeb) {
    final Uri gmailUrl = Uri.https('mail.google.com', '/mail/', {
      'view': 'cm',
      'fs': '1',
      'to': emailAddress,
      'su': subject,
    });

    try {
      await launchUrl(gmailUrl, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Could not open Gmail: $e');
    }

    return;
  }

  // ----------------------------------------------------------
  // MOBILE / DESKTOP APP
  // ----------------------------------------------------------
  final Uri emailUrl = Uri(
    scheme: 'mailto',
    path: emailAddress,
    queryParameters: {'subject': subject},
  );

  try {
    if (await canLaunchUrl(emailUrl)) {
      await launchUrl(emailUrl, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('No email application is available.');
    }
  } catch (e) {
    debugPrint('Email launch error: $e');
  }
}
