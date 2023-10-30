import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:flutter/material.dart';

final class ImplementationFlowTitle extends StatelessWidget {
  const ImplementationFlowTitle({
    required this.index,
    required this.title,
    super.key,
  });

  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        const ScalerGap(12),
        Text(
          '$index. $title',
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
