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
  bool _hovered = false;

  bool get hovered => _hovered;

  void setHover(bool value) {
    if (!kIsWeb) return;

    if (_hovered == value) return;

    _hovered = value;
    notifyListeners();
  }
}
