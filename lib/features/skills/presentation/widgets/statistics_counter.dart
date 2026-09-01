import 'package:flutter/material.dart';
import 'package:hassanzamin/repositories/responsive.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  late Animation<int> _animation;

  bool _hasStarted = false;

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
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  void _startCounter() {
    if (_hasStarted) return;

    _hasStarted = true;

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
        : 18;

    return VisibilityDetector(
      key: Key('statistics-${widget.title}'),

      onVisibilityChanged: (info) {
        // Start when at least 25% of the card becomes visible.
        if (info.visibleFraction >= 0.25) {
          _startCounter();
        }
      },

      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
              borderRadius: BorderRadius.circular(18),
              color: Colors.white.withValues(alpha: 0.03),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${_animation.value}+',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: numberSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

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
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
