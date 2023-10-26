import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:flutter/material.dart';

final class AgendaTitle extends StatelessWidget {
  const AgendaTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        const ScalerGap(12),
        Text(
          '\u2022  $title',
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
