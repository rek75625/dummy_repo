import 'package:flutter/material.dart';

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
