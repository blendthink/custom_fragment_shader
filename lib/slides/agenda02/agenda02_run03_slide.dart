import 'package:custom_fragment_shader/components/agenda02/orange_frame.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda02Run03Slide extends SlideStatelessWidget {
  const Agenda02Run03Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
import 'package:flutter/material.dart';
import 'package:sample_app/orange_frame.dart';

void main() async {
  runApp(
    const MaterialApp(
      home: Center(
        child: SizedBox.square(
          dimension: 160,
          child: OrangeFrame(),
        ),
      ),
    ),
  );
}''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/main.dart',
      language: Language.dart,
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
        Expanded(
          child: Center(
            child: SizedBox.square(
              dimension: 160 * context.frameScale,
              child: const OrangeFrame(),
            ),
          ),
        ),
      ],
    );

    return TitleHeaderSlide(
      title: Agenda.agenda02,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
次のように main.dart を書き換えて、アプリを実行すると
無事に右のようなオレンジ色の正方形が描画できました。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
