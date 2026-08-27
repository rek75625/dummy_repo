import 'package:flutter/material.dart';
import 'package:hassanzamin/features/portfolio/presentation/screens/portfolio_details_screen.dart';
import 'package:hassanzamin/repositories/responsive.dart';
import 'package:provider/provider.dart';

import '../../provider/portfolio_provider.dart';
import 'portfolio_card.dart';

class PortfolioGrid extends StatelessWidget {
  const PortfolioGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PortfolioProvider>();

    int crossAxisCount = 4;

    if (Responsive.isTablet(context)) {
      crossAxisCount = 2;
    }

    if (Responsive.isMobile(context)) {
      crossAxisCount = 1;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: provider.filteredItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        childAspectRatio: .75,
      ),
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            final portfolio = provider.filteredItems[index];

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PortfolioDetailsScreen(
                  index: index,
                  portfolioModel: portfolio,
                ),
              ),
            );
          },
          child: PortfolioCard(
            portfolio: provider.filteredItems[index],
            index: index,
          ),
        );
      },
    );
  }
}
