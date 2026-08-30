import 'package:flutter/foundation.dart';

class PartnerProvider extends ChangeNotifier {
  final List<String> logos = [
    "assets/companies/hilal.jpg",
    "assets/companies/blueband.jpeg",
    "assets/companies/jeda.png",
    "assets/companies/walls.png",
    "assets/companies/loreal.png",
    "assets/companies/mtj.jpg",
    "assets/companies/dera.jpg",
    "assets/companies/escobar.jpg",
    "assets/companies/gsk.jpg",
    "assets/companies/iehsas.png",
    "assets/companies/vida.jpg",
    "assets/companies/pharma.png",
  ];
}

class MouseRegionForPartnerProvider extends ChangeNotifier {
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

  void clearAll() {
    if (_hoveredIndex == null) return;

    _hoveredIndex = null;
    notifyListeners();
  }
}
