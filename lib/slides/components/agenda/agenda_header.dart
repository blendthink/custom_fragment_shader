import 'package:flutter/material.dart';

final class AgendaHeader extends StatelessWidget {
  const AgendaHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'Agenda',
      style: theme.textTheme.headlineMedium,
    );
  }
}
