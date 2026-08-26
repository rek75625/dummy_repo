import 'package:flutter/material.dart';

class ServiceHoverCard extends StatefulWidget {
  final String number;
  final String title;
  final String description;
  final IconData icon;
  final String statValue;
  final String statLabel;
  final String? secondStatValue;
  final String? secondStatLabel;

  final VoidCallback? onTap;

  const ServiceHoverCard({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
    required this.statValue,
    required this.statLabel,
    this.secondStatValue,
    this.secondStatLabel,
    this.onTap,
  });

  @override
  State<ServiceHoverCard> createState() => _ServiceHoverCardState();
}

class _ServiceHoverCardState extends State<ServiceHoverCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  late final AnimationController _controller;

  late final Animation<double> _scaleAnimation;
  late final Animation<double> _statsAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.015,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _statsAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setHover(bool value) {
    if (_isHovered == value) return;

    setState(() {
      _isHovered = value;
    });

    if (value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(scale: _scaleAnimation.value, child: child);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutCubic,
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 135),
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 22),
            decoration: BoxDecoration(
              color: _isHovered
                  ? const Color(0xffF5F5F5)
                  : const Color(0xff24204F),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: _isHovered
                    ? const Color(0xffFFD43B)
                    : Colors.white.withValues(alpha: 0.85),
                width: 1.4,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: const Color(0xffFFD43B).withValues(alpha: 0.15),
                        blurRadius: 25,
                        offset: const Offset(0, 12),
                      ),
                    ]
                  : [],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final bool compact = constraints.maxWidth < 500;

                return compact ? _buildCompactLayout() : _buildDesktopLayout();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        _buildIcon(),

        const SizedBox(width: 22),

        Expanded(child: _buildContent()),

        const SizedBox(width: 20),

        _buildStats(),

        const SizedBox(width: 18),

        _buildArrow(),
      ],
    );
  }

  Widget _buildCompactLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildIcon(),
            const SizedBox(width: 18),
            Expanded(child: _buildContent()),
            const SizedBox(width: 10),
            _buildArrow(),
          ],
        ),

        if (_isHovered) ...[const SizedBox(height: 18), _buildStats()],
      ],
    );
  }

  // -------------------------------------------------------------------------
  // ICON
  // -------------------------------------------------------------------------

  Widget _buildIcon() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: _isHovered ? const Color(0xff24204F) : const Color(0xffFFD43B),
        borderRadius: BorderRadius.circular(18),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Icon(
          widget.icon,
          key: ValueKey(_isHovered),
          size: 32,
          color: _isHovered ? const Color(0xffFFD43B) : const Color(0xff24204F),
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // CONTENT
  // -------------------------------------------------------------------------

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
            height: 1.15,
            color: _isHovered ? const Color(0xff24204F) : Colors.white,
          ),
          child: Text(
            widget.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        const SizedBox(height: 8),

        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          style: TextStyle(
            fontSize: 15,
            height: 1.55,
            fontWeight: FontWeight.w400,
            color: _isHovered
                ? const Color(0xff4D496D)
                : Colors.white.withValues(alpha: 0.60),
          ),
          child: Text(
            widget.description,
            maxLines: _isHovered ? 2 : 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // -------------------------------------------------------------------------
  // STATS
  // -------------------------------------------------------------------------

  Widget _buildStats() {
    return SizeTransition(
      sizeFactor: _statsAnimation,
      axis: Axis.horizontal,

      child: FadeTransition(
        opacity: _statsAnimation,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStat(widget.statValue, widget.statLabel),

            if (widget.secondStatValue != null &&
                widget.secondStatLabel != null) ...[
              const SizedBox(width: 22),
              _buildStat(widget.secondStatValue!, widget.secondStatLabel!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: const TextStyle(
            color: Color(0xff24204F),
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
          child: Text(value),
        ),

        const SizedBox(height: 2),

        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: const TextStyle(
            color: Color(0xff77738E),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          child: Text(label.toUpperCase()),
        ),
      ],
    );
  }

  // -------------------------------------------------------------------------
  // ARROW
  // -------------------------------------------------------------------------

  Widget _buildArrow() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      width: _isHovered ? 48 : 32,
      height: _isHovered ? 48 : 32,
      decoration: BoxDecoration(
        color: _isHovered ? const Color(0xffFFD43B) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          style: TextStyle(
            color: _isHovered
                ? const Color(0xff24204F)
                : Colors.white.withValues(alpha: 0.65),
            fontSize: _isHovered ? 24 : 28,
            fontWeight: FontWeight.w300,
          ),
          child: const Text('→'),
        ),
      ),
    );
  }
}
