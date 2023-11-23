import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda03Compile01Slide extends SlideStatelessWidget {
  const Agenda03Compile01Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
# ...
flutter:
  # ...
  shaders:
    - shaders/orange.frag''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'pubspec.yaml',
      language: Language.yaml,
      theme: androidStudioThemeForYaml,
    );

    final body = Row(
      children: [
        Expanded(
          child: SizedBox(
            height: double.infinity,
            child: codeBlock,
          ),
        ),
        const Expanded(child: Center()),
      ],
    );

    return TitleHeaderSlide(
      title: Agenda.agenda03,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
まずは、pubspec.yaml にこのような設定をすることによって、何が起きるのかをみていきます。

Flutter でアプリを実行するときは `flutter run` コマンドを実行しています。
`flutter run` コマンドを実行すると、基本的に `flutter assemble` コマンドも自動で実行されるようになっています。

この `flutter assemble` コマンドの処理の中身をみていくと、どのようなことが起きているのか分かってきます。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
