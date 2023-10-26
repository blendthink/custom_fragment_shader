import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

final class PresentationTitle extends StatelessWidget {
  const PresentationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var title = Text(
      'Custom Fragment Shader',
      style: theme.textTheme.displaySmall,
    ).animate(adapter: ValueAdapter(0.5)).shimmer(
      duration: 800.ms,
      colors: [
        const Color(0xFFFF57DD),
        const Color(0xFF56C2FF),
        const Color(0xFFF3EF93),
        const Color(0xFFF17A37),
      ],
    );

    title = title
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .saturate(delay: 1.seconds, duration: 2.seconds)
        .then()
        .tint(color: const Color(0xFF80DDFF));

    return title;
  }
}
