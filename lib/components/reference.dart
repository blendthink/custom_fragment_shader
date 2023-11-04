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
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const ScalerGap(16),
          Text(
            reference,
            textAlign: TextAlign.end,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.secondary,
            ),
          ),
          const ScalerGap(16),
        ],
      ),
    );
  }
}
