import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda03Load01Slide extends SlideStatelessWidget {
  const Agenda03Load01Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

final class OrangeFrame extends StatelessWidget {
  const OrangeFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: 'shaders/orange.frag',
      (context, shader, child) {
        
      },
    );
  }
}''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/orange_frame.dart',
      language: Language.dart,
      theme: androidStudioTheme,
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
では、次に`ShaderBuilder` の実装部分、アプリ側から Fragment Shader を読み込む部分がどうなっているのかを見ていきます。

`assetKey` で指定した値がどこで使われているか確認すると''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
