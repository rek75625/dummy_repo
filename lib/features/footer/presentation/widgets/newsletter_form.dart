import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_colors.dart';
import '../../provider/footer_provider.dart';

class NewsletterSection extends StatelessWidget {
  const NewsletterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final bool mobile = screenWidth < 900;
    final bool tablet = screenWidth >= 900 && screenWidth < 1200;

    return Container(
      width: double.infinity,
      color: AppColors.yellow,
      padding: EdgeInsets.symmetric(
        horizontal: mobile
            ? 20
            : tablet
            ? 40
            : 80,
        vertical: mobile ? 50 : 80,
      ),
      child: mobile
          ? const _MobileLayout()
          : tablet
          ? const _TabletLayout()
          : const _DesktopLayout(),
    );
  }
}

////////////////////////////////////////////////////////////////
/// MOBILE
////////////////////////////////////////////////////////////////

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FooterProvider>();

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Subscribe To Newsletter",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "Get marketing insights and business growth strategies directly in your inbox.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.8),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: provider.emailController,
              decoration: InputDecoration(
                hintText: "Enter your email",
                filled: true,
                fillColor: AppColors.grey,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            const SizedBox(height: 18),

            SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: provider.loading ? null : provider.subscribe,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: provider.loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Subscribe",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////
/// TABLET
////////////////////////////////////////////////////////////////

class _TabletLayout extends StatelessWidget {
  const _TabletLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Heading(center: true, titleSize: 40, bodySize: 18),

        const SizedBox(height: 40),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: const NewsletterForm(),
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////
/// DESKTOP
////////////////////////////////////////////////////////////////

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          flex: 5,
          child: _Heading(center: false, titleSize: 52, bodySize: 19),
        ),

        const SizedBox(width: 70),

        Expanded(
          flex: 4,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: const NewsletterForm(),
          ),
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////
/// HEADING
////////////////////////////////////////////////////////////////

class _Heading extends StatelessWidget {
  final bool center;
  final double titleSize;
  final double bodySize;

  const _Heading({
    required this.center,
    required this.titleSize,
    required this.bodySize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          "Subscribe To Newsletter",
          textAlign: center ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.2,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          "Get marketing insights and business growth strategies directly in your inbox.",
          textAlign: center ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: bodySize,
            color: Colors.black87,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////
/// TABLET & DESKTOP FORM
////////////////////////////////////////////////////////////////

class NewsletterForm extends StatelessWidget {
  const NewsletterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FooterProvider>();

    return LayoutBuilder(
      builder: (context, constraints) {
        // Switch to vertical layout if there isn't enough width
        final bool vertical = constraints.maxWidth < 520;

        if (vertical) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: provider.emailController,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  filled: true,
                  fillColor: AppColors.grey,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: provider.loading ? null : provider.subscribe,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: provider.loading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "Subscribe",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(
              child: TextField(
                controller: provider.emailController,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  filled: true,
                  fillColor: AppColors.background,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            SizedBox(
              width: 160,
              height: 56,
              child: ElevatedButton(
                onPressed: provider.loading ? null : provider.subscribe,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: provider.loading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        "Subscribe",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
