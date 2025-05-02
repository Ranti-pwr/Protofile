import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  final List<String> navItems = const [
    'Home',
    'About',
    'Projects',
    'Testimonials',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              ShaderMask(
                shaderCallback:
                    (bounds) => const LinearGradient(
                      colors: [
                        Colors.pinkAccent,
                        Colors.deepPurple,
                        Colors.blue,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                child: Text(
                      'Pro Gabut',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Colors.white, // masked by gradient
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            blurRadius: 6,
                            color: Colors.black26,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .slideX(begin: -1, duration: 600.ms)
                    .shimmer(duration: 1200.ms),
              ),
              const Spacer(),
              // Navigation items
              ...navItems.map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: InkWell(
                    onTap: () {
                      // TODO: Implement smooth scrolling to sections
                    },
                    hoverColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      child: Text(
                        item,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
