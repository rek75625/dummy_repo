// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/partner_provider.dart';
import 'partner_logo_card.dart';

class AutoScrollLogos extends StatefulWidget {
  const AutoScrollLogos({super.key});

  @override
  State<AutoScrollLogos> createState() => _AutoScrollLogosState();
}

class _AutoScrollLogosState extends State<AutoScrollLogos> {
  final ScrollController controller = ScrollController();

  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      if (!controller.hasClients) return;

      if (controller.offset >= controller.position.maxScrollExtent) {
        controller.jumpTo(0);
      } else {
        controller.jumpTo(controller.offset + 1);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PartnerProvider>();

    final items = [...provider.logos, ...provider.logos, ...provider.logos];

    return SizedBox(
      height: 140,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (_, index) {
          return PartnerLogoCard(image: items[index]);
        },
      ),
    );
  }
}
