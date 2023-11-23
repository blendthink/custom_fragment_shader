import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda02Load01Slide extends SlideStatelessWidget {
  const Agenda02Load01Slide({super.key});

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
      title: Agenda.agenda02,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
まずは、pubspec.yaml の flutter の shaders という項目を追加して、その中に先ほど作成したプログラムファイルのファイルパスを記述します。

このように設定することによって、シェーダーが適切にコンパイルされ、必要なランタイムメタデータを自動的に生成するようになります。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
