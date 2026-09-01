import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hassanzamin/core/widgets/primary_button.dart';
import 'package:hassanzamin/core/widgets/secondary_button.dart';

class HerosButtons extends StatelessWidget {
  const HerosButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(
          text: "Read More",
          onPressed: () {
            context.pushNamed('about');
          },
          index: 0,
        ),

        const SizedBox(width: 20),

        SecondaryButton(
          text: "Our Services",
          onPressed: () {
            context.pushNamed('ourServices');
          },
          index: 1,
        ),
      ],
    );
  }
}
