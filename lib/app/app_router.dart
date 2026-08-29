import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hassanzamin/features/home/presentation/screens/home_screen.dart';

import 'package:hassanzamin/features/about/presentation/screens/about_details_screen.dart';

import 'package:hassanzamin/features/contact/presentation/contact_details_screen.dart';

import 'package:hassanzamin/features/partners/presentation/screens/partner_details_screen.dart';

import 'package:hassanzamin/features/portfolio/model/portfolio_model.dart';
import 'package:hassanzamin/features/portfolio/presentation/screens/portfolio_details_screen.dart';

import 'package:hassanzamin/features/services/presentation/screens/services_screen.dart';
import 'package:hassanzamin/features/services/presentation/screens/services_details_screen.dart';

import 'package:hassanzamin/features/skills/presentation/screen/skills_details_screen.dart';

// ============================================================
// GLOBAL APP ROUTER
// ============================================================

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // ========================================================
    // HOME
    // ========================================================

    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),

    // ========================================================
    // ABOUT
    // ========================================================
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) {
        return AboutDetailScreen();
      },
    ),

    // ========================================================
    // CONTACT
    // ========================================================
    GoRoute(
      path: '/contact',
      name: 'contact',
      builder: (context, state) {
        return ContactDetailScreen();
      },
    ),

    // ========================================================
    // PARTNERS
    // ========================================================
    GoRoute(
      path: '/partners',
      name: 'partners',
      builder: (context, state) {
        return const PartnersDetailsScreen();
      },
    ),

    // ========================================================
    // PORTFOLIO
    // ========================================================
    GoRoute(
      path: '/portfolio',
      name: 'portfolio',
      builder: (context, state) {
        // Return your PortfolioScreen here
        return const SizedBox();
      },
    ),

    // ========================================================
    // PORTFOLIO DETAILS
    // ========================================================
    GoRoute(
      path: '/portfolio/details',
      name: 'portfolioDetails',
      builder: (context, state) {
        final extra = state.extra;

        if (extra is! PortfolioDetailsArguments) {
          return const _RouteErrorScreen(
            title: 'Portfolio details unavailable',
            message: 'No portfolio data was provided.',
          );
        }
        return PortfolioDetailsScreen(
          portfolioModel: extra.portfolioModel,
          index: extra.index,
        );
      },
    ),

    // ========================================================
    // SERVICES
    // ========================================================
    GoRoute(
      path: '/services',
      name: 'services',
      builder: (context, state) {
        return const ServicesScreen();
      },
    ),

    // ========================================================
    // SERVICES DETAILS
    // ========================================================
    GoRoute(
      path: '/services/details',
      name: 'servicesDetails',
      builder: (context, state) {
        final extra = state.extra;

        if (extra is! int) {
          return const _RouteErrorScreen(
            title: 'Service details unavailable',
            message: 'No service index was provided.',
          );
        }
        return ServicesDetailScreen(initialIndex: extra);
      },
    ),

    // ========================================================
    // SKILLS DETAILS
    // ========================================================
    GoRoute(
      path: '/skills/details',
      name: 'skillsDetails',
      builder: (context, state) {
        final extra = state.extra;

        if (extra is! int) {
          return const _RouteErrorScreen(
            title: 'Skill details unavailable',
            message: 'No skill index was provided.',
          );
        }
        return SkillsDetailsScreen(index: extra);
      },
    ),
  ],
);

// ============================================================
// PORTFOLIO ARGUMENTS
// ============================================================

class PortfolioDetailsArguments {
  final PortfoliosModel portfolioModel;

  final int index;

  const PortfolioDetailsArguments({
    required this.portfolioModel,
    required this.index,
  });
}

// ============================================================
// GO HOME
// ============================================================

void goHome() {
  appRouter.go('/');
}

// ============================================================
// ERROR SCREEN
// ============================================================

class _RouteErrorScreen extends StatelessWidget {
  final String title;

  final String message;

  const _RouteErrorScreen({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              const Icon(Icons.error_outline_rounded, size: 60),

              const SizedBox(height: 20),

              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),
              Text(message, textAlign: TextAlign.center),
              SizedBox(height: 25),
              ElevatedButton(onPressed: goHome, child: const Text('Go Home')),
            ],
          ),
        ),
      ),
    );
  }
}
