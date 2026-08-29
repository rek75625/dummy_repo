import 'package:flutter/material.dart';
import 'package:hassanzamin/core/animations/hover_animation.dart';
import 'package:hassanzamin/core/widgets/animated_gradient.dart';
import 'package:hassanzamin/features/about/provider/about_provider.dart';
import 'package:hassanzamin/features/footer/provider/footer_provider.dart';
import 'package:hassanzamin/features/home/provider/floating_action_provider.dart';
import 'package:hassanzamin/features/home/provider/home_provider.dart';
import 'package:hassanzamin/features/partners/provider/partner_provider.dart';
import 'package:hassanzamin/features/portfolio/provider/portfolio_provider.dart';
import 'package:hassanzamin/features/reviews/provider/review_provider.dart';
import 'package:hassanzamin/features/services/provider/detail_screen_card_provider.dart';
import 'package:hassanzamin/features/services/provider/service_provider.dart';
import 'package:hassanzamin/features/services/service_model.dart';
import 'package:hassanzamin/features/skills/provider/skill_provider.dart';
import 'package:hassanzamin/providers/navigation_provider.dart';
import 'package:hassanzamin/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ThemeProvider.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => AboutProvider()),
        ChangeNotifierProvider(create: (_) => PartnerProvider()),
        ChangeNotifierProvider(create: (_) => ServiceProvider()),
        ChangeNotifierProvider(create: (_) => PortfolioProvider()),
        ChangeNotifierProvider(create: (_) => ReviewsProvider()),
        ChangeNotifierProvider(create: (_) => SkillProvider()),
        ChangeNotifierProvider(create: (_) => FooterProvider()),
        ChangeNotifierProvider(create: (_) => FloatingActionsProvider()),
        ChangeNotifierProvider(create: (_) => MouseRegionProvider()),
        ChangeNotifierProvider(create: (_) => ToggleProvider()),
        ChangeNotifierProvider(create: (_) => LoaderProvider()),
        ChangeNotifierProvider(create: (_) => SelectServicesProvider()),
        ChangeNotifierProvider(create: (_) => DetailScreenCardProvider()),
      ],
      child: const PortfolioApp(),
    ),
  );
}
