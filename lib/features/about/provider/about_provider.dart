import 'package:flutter/material.dart';

class AboutProvider extends ChangeNotifier {
  final List<String> features = [
    "Performance Marketing",
    "Business Growth Strategy",
    "Lead Generation",
    "Brand Positioning",
  ];
}

class LoaderProvider with ChangeNotifier {
  bool _load = true;

  bool get load => _load;

  void setLoading(bool value) {
    if (_load == value) return;

    _load = value;
    notifyListeners();
  }
}
