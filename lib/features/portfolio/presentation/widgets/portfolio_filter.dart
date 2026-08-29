import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../provider/portfolio_provider.dart';

class PortfolioFilter extends StatelessWidget {
  const PortfolioFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PortfolioProvider>();

    return Wrap(
      spacing: 15,
      children: List.generate(provider.categories.length, (index) {
        final selected = provider.selectedCategory == index;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ChoiceChip(
            label: Text(provider.categories[index]),
            selected: selected,
            selectedColor: AppColors.yellow,
            backgroundColor: Colors.white10,
            labelStyle: TextStyle(
              color: selected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600,
            ),
            onSelected: (_) => provider.changesCategory(index),
          ),
        );
      }),
    );
  }
}
