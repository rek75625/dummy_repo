import 'package:flutter/material.dart';
import 'package:hassanzamin/features/skills/provider/skill_provider.dart';
import 'package:hassanzamin/repositories/responsive.dart';
import 'package:provider/provider.dart';

class StatisticsCounter extends StatefulWidget {
  final int value;
  final String title;

  const StatisticsCounter({
    super.key,
    required this.value,
    required this.title,
  });

  @override
  State<StatisticsCounter> createState() => _StatisticsCounterState();
}

class _StatisticsCounterState extends State<StatisticsCounter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<int> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = IntTween(
      begin: 0,
      end: widget.value,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final bool mobile = Responsive.isMobile(context);
    final bool tablet = Responsive.isTablet(context);

    final double numberSize = mobile
        ? 30
        : tablet
        ? 35
        : 52;

    final double titleSize = mobile
        ? 16
        : tablet
        ? 18
        : 20;

    final double padding = mobile
        ? 20
        : tablet
        ? 16
        : 2;

    return AnimatedBuilder(
      animation: _animation,
      builder: (_, _) {
        return Container(
          margin: EdgeInsets.all(8),
          width: double.infinity,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withValues(alpha: .25)),
            borderRadius: BorderRadius.circular(18),
            color: Colors.white.withValues(alpha: .03),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${_animation.value}+",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: numberSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: titleSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class StatisticsRow extends StatelessWidget {
  const StatisticsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SkillProvider>(context, listen: false);

    if (Responsive.isMobile(context)) {
      return Column(
        children: provider.statistics
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: StatisticsCounter(value: e.value, title: e.title),
              ),
            )
            .toList(),
      );
    }

    if (Responsive.isTablet(context)) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: provider.statistics.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          childAspectRatio: 1.6,
        ),
        itemBuilder: (_, index) {
          final stat = provider.statistics[index];

          return StatisticsCounter(value: stat.value, title: stat.title);
        },
      );
    }

    return Row(
      children: provider.statistics
          .map(
            (e) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: StatisticsCounter(value: e.value, title: e.title),
              ),
            ),
          )
          .toList(),
    );
  }
}
