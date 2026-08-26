import 'package:go_router/go_router.dart';

import 'package:hassanzamin/features/about/presentation/screens/about_screen.dart';
import 'package:hassanzamin/features/contact/presentation/screens/contact_screen.dart';
import 'package:hassanzamin/features/home/presentation/screens/home_screen.dart';
import 'package:hassanzamin/features/services/presentation/screens/services_screen.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(path: "/", builder: (context, state) => HomeScreen()),

      GoRoute(
        path: "/about",
        builder: (context, state) => const AboutScreen(isDetails: false),
      ),

      GoRoute(
        path: "/services",
        builder: (context, state) => const ServicesScreen(),
      ),

      GoRoute(
        path: "/contact",
        builder: (context, state) => const ContactScreen(),
      ),
    ],
  );
}
