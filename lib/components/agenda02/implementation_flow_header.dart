import 'package:flutter/material.dart';

final class ImplementationFlowHeader extends StatelessWidget {
  const ImplementationFlowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'Fragment Shader の実装の流れ',
      style: theme.textTheme.titleLarge,
    );
  }
}
