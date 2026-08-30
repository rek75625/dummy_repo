import 'package:flutter/material.dart';
import 'package:hassanzamin/features/contact/presentation/contact_details_screen.dart';
import 'package:hassanzamin/features/partners/presentation/screens/partner_details_screen.dart';
import 'package:hassanzamin/features/partners/presentation/screens/partners_screen.dart';
import 'package:hassanzamin/features/portfolio/provider/portfolio_provider.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';
import '../widgets/home_appbar.dart';

import 'package:hassanzamin/features/home/presentation/widgets/hero_section.dart';
import 'package:hassanzamin/features/about/presentation/screens/about_screen.dart';
import 'package:hassanzamin/features/about/presentation/screens/about_details_screen.dart';

import 'package:hassanzamin/features/services/presentation/screens/services_screen.dart';
import 'package:hassanzamin/features/services/presentation/screens/services_details_screen.dart';

import 'package:hassanzamin/features/portfolio/presentation/screens/portfolio_screen.dart';
import 'package:hassanzamin/features/portfolio/presentation/screens/portfolio_details_screen.dart';

import 'package:hassanzamin/features/partners/presentation/screens/moving_banner.dart';

import 'package:hassanzamin/features/reviews/presentation/screens/review_screen.dart';
import 'package:hassanzamin/features/reviews/presentation/screens/review_details_screen.dart';

import 'package:hassanzamin/features/skills/presentation/screen/skill_screen.dart';
import 'package:hassanzamin/features/skills/presentation/screen/skills_details_screen.dart';

import 'package:hassanzamin/features/footer/presentation/screens/newsletter_section.dart';
import 'package:hassanzamin/features/footer/presentation/screens/footer_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Scaffold(
      endDrawer: mobileDrawer(context, provider),

      body: _buildBody(context, provider),

      floatingActionButton:
          provider.currentPage == HomePage.home && provider.showFab
          ? FloatingActionButton(
              onPressed: provider.scrollingToTop,
              backgroundColor: Colors.amber.shade600,
              child: Icon(Icons.arrow_circle_up, color: Colors.black),
            )
          : null,
    );
  }

  Widget _buildBody(BuildContext context, HomeProvider provider) {
    switch (provider.currentPage) {
      case HomePage.about:
        return AboutDetailScreen();

      case HomePage.services:
        return ServicesDetailScreen();

      case HomePage.portfolio:
        return PortfolioDetailsScreen(
          index: provider.selectedPortfolioIndex,
          portfolioModel: Provider.of<PortfolioProvider>(
            context,
            listen: false,
          ).filteredItems[provider.selectedPortfolioIndex],
        );

      case HomePage.partners:
        return PartnersDetailsScreen();

      case HomePage.reviews:
        return ReviewDetailsScreen();

      case HomePage.skills:
        return SkillsDetailsScreen(index: provider.selectedPortfolioIndex);

      case HomePage.contact:
        return ContactDetailScreen();

      case HomePage.home:
        return SingleChildScrollView(
          controller: provider.scrollController,
          child: Column(
            children: [
              appBar(context, provider),

              HeroSections(key: provider.homeKey),

              AboutScreen(key: provider.aboutKey, isDetails: true),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 80),
                child: MotionBanners(),
              ),

              ServicesScreen(key: provider.servicesKey),

              PortfolioSection(key: provider.portfolioKey),

              PartnersSection(key: provider.partnersKey),

              ReviewsSection(key: provider.reviewKey),

              SkillsSection(key: provider.skillsKey),

              NewsletterSection(key: provider.newsletterKey),

              FooterSection(key: provider.footerKey),
            ],
          ),
        );
    }
  }
}
