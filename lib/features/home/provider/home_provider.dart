import 'package:flutter/material.dart';

enum HomePage {
  home,
  about,
  services,
  portfolio,
  partners,
  reviews,
  skills,
  contact,
}

class HomeProvider extends ChangeNotifier {
  //================ Scroll =================//

  final ScrollController scrollController = ScrollController();

  bool showFab = false;

  HomeProvider() {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final visible = scrollController.offset > 300;

    if (visible != showFab) {
      showFab = visible;
      notifyListeners();
    }
  }

  Future<void> scrollToTop() async {
    if (!scrollController.hasClients) return;

    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  //================ Pages =================//

  HomePage currentPage = HomePage.home;
  int selectedPortfolioIndex = 0;

  void openHome() {
    currentPage = HomePage.home;
    notifyListeners();
  }

  void openAbout() {
    currentPage = HomePage.about;
    notifyListeners();
  }

  void openServices() {
    currentPage = HomePage.services;
    notifyListeners();
  }

  void openPortfolio(int index) {
    selectedPortfolioIndex = index;
    currentPage = HomePage.portfolio;
    notifyListeners();
  }

  void openPartners() {
    currentPage = HomePage.partners;
    notifyListeners();
  }

  void openReviews() {
    currentPage = HomePage.reviews;
    notifyListeners();
  }

  void openSkills(int index) {
    selectedPortfolioIndex = index;
    currentPage = HomePage.skills;
    notifyListeners();
  }

  void openContact() {
    currentPage = HomePage.contact;
    notifyListeners();
  }

  //================ Scroll Sections =================//

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey portfolioKey = GlobalKey();
  final GlobalKey reviewKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey newsletterKey = GlobalKey();
  final GlobalKey footerKey = GlobalKey();
  final GlobalKey partnersKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
