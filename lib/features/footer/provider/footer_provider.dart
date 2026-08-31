import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();

  bool loading = false;

  Future<void> subscribe() async {
    if (emailController.text.isEmpty) return;

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

Future<void> openSocialMedia(String url) async {
  final Uri socialUrl = Uri.parse(url);

  if (await canLaunchUrl(socialUrl)) {
    await launchUrl(socialUrl, mode: LaunchMode.externalApplication);
  }
}
