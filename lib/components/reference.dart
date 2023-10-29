import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:flutter/material.dart';

final class Reference extends StatelessWidget {
  const Reference(
    this.reference, {
    super.key,
  });

  final String reference;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          reference,
          textAlign: TextAlign.end,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
        const ScalerGap(16),
      ],
    );
  }
}
