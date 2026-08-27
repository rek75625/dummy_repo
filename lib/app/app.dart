import 'package:flutter/material.dart';
import 'package:hassanzamin/app/app_router.dart';
import 'package:hassanzamin/core/themes/app_theme.dart';
import 'package:hassanzamin/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Hassan Zamin",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: context.watch<ThemeProvider>().themeMode,
      routerConfig: appRouter,
    );
  }
}
