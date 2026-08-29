import 'package:flutter/material.dart';

class FloatingActionsProvider extends ChangeNotifier {
  late ScrollController scrollController;

  void initialize(ScrollController controller) {
    scrollController = controller;
  }

  Future<void> scrollingToTop() async {
    if (!scrollController.hasClients) return;

    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
