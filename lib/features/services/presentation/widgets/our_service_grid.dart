import 'package:flutter/material.dart';
import 'package:hassanzamin/features/services/presentation/widgets/our_service_card.dart';
import 'package:hassanzamin/features/services/provider/our_service_provider.dart';
import 'package:provider/provider.dart';

class OurServicesGrid extends StatelessWidget {
  const OurServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final bool mobile = width < 700;
        final bool tablet = width >= 700 && width < 1200;

        final int columns = mobile
            ? 1
            : tablet
            ? 2
            : 4;

        final double horizontalPadding = mobile
            ? 18
            : tablet
            ? 35
            : 55;

        final double spacing = mobile
            ? 18
            : tablet
            ? 22
            : 24;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: context.read<OurServiceProvider>().services.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
              childAspectRatio: mobile
                  ? .88
                  : tablet
                  ? .88
                  : .70,
            ),
            itemBuilder: (context, index) {
              return OurServiceCard(index: index);
            },
          ),
        );
      },
    );
  }
}
