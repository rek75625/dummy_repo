import 'package:flutter/material.dart';
import 'package:hassanzamin/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ThemeProvider>();

    return IconButton(
      tooltip: "Toggle Theme",
      onPressed: provider.toggleTheme,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Icon(
          provider.themeMode == ThemeMode.dark
              ? Icons.light_mode
              : Icons.dark_mode,
          key: ValueKey(provider.themeMode),
        ),
      ),
    );
  }
}
