import 'package:flutter/material.dart';

class TextFieldsProvider extends ChangeNotifier {
  bool hover = false;
  bool focused = false;

  void setHover(bool value) {
    if (hover == value) return;

    hover = value;
    notifyListeners();
  }

  void setFocused(bool value) {
    if (focused == value) return;

    focused = value;
    notifyListeners();
  }
}
