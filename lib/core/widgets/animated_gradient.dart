import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 1. CLEANED WIDGET: Can now be a simple StatelessWidget
class AnimatedGradient extends StatelessWidget {
  final Widget child;

  const AnimatedGradient({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Watches the provider for automated 4-second flips
    final isToggle = context.watch<ToggleProvider>().toggle;

    return AnimatedContainer(
      duration: const Duration(seconds: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: isToggle ? Alignment.topLeft : Alignment.bottomRight,
          end: isToggle ? Alignment.bottomRight : Alignment.topLeft,
          colors: const [
            Color(0xff211E4B),
            Color(0xff2A2757),
            Color(0xff37306D),
          ],
        ),
      ),
      child: child,
    );
  }
}

// 2. ENHANCED PROVIDER: Manages the 4-second loop internally
class ToggleProvider with ChangeNotifier {
  bool _toggle = false;
  Timer? _timer;

  bool get toggle => _toggle;

  ToggleProvider() {
    // Start the periodic loop immediately when the provider is created
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      _toggle = !_toggle;
      notifyListeners();
    });
  }

  // Good practice: Clean up the timer if the provider is destroyed
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
