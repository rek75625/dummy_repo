import 'package:flutter/material.dart';

class FloatingActionProvider extends ChangeNotifier {
  late ScrollController scrollController;

  void initialize(ScrollController controller) {
    scrollController = controller;
  }

  Future<void> scrollToTop() async {
    if (!scrollController.hasClients) return;

    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
