import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda02GlslSlide extends SlideStatelessWidget {
  const Agenda02GlslSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final abbrTextStyle = textTheme.headlineLarge?.copyWith(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w900,
    );

    final body = Center(
      child: Text(
        'GLSL',
        style: abbrTextStyle,
      ),
    );

    return TitleHeaderSlide(
      title: Agenda.agenda02,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
はじめに話しておくと Fragment Shader 用のプログラムファイルは Dart では記述しません。
GLSL という別の言語で記述します。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
