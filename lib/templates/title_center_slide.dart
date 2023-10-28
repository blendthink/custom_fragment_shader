import 'package:flutter/material.dart';

final class TitleCenterSlide extends StatelessWidget {
  const TitleCenterSlide(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Text(
        title,
        style: theme.textTheme.titleLarge,
      ),
    );
  }
}
