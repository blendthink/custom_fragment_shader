import 'package:flutter/material.dart';

final class SpeakerIntro extends StatelessWidget {
  const SpeakerIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const text = '''
おかやまん / blendthink
株式会社ゆめみ
Flutter テックリード
将棋・プログラミング''';
    return Text(
      text,
      style: theme.textTheme.bodyLarge?.copyWith(
        height: 2,
      ),
    );
  }
}
