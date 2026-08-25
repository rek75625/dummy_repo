import 'package:flutter/material.dart';
import 'package:hassanzamin/features/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class SkillsDetailsScreen extends StatelessWidget {
  final int index;
  const SkillsDetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        controller: provider.scrollController,
        child: Column(children: [Center(child: Text("data"))]),
      ),
    );
  }
}
