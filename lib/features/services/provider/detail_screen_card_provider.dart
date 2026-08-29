import 'package:flutter/material.dart';

class DetailScreenCardProvider extends ChangeNotifier {
  int? _hoveredIndex;

  int? get hoveredIndex => _hoveredIndex;

  bool isHovered(int index) {
    return _hoveredIndex == index;
  }

  void setHover(int index) {
    if (_hoveredIndex == index) return;

    _hoveredIndex = index;
    notifyListeners();
  }

  void clearHover(int index) {
    if (_hoveredIndex != index) return;

    _hoveredIndex = null;
    notifyListeners();
  }

  void toggleHover(int index) {
    if (_hoveredIndex == index) {
      _hoveredIndex = null;
    } else {
      _hoveredIndex = index;
    }

    notifyListeners();
  }
}
