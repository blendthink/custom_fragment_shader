import 'package:custom_fragment_shader/components/reference.dart';
import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/gen/assets.gen.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda02Load02Slide extends SlideStatelessWidget {
  const Agenda02Load02Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
# ...
dependencies:
  # ...
  flutter_shaders: ^0.1.2''';

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
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.agenda02.flutterShaders.image(
                height: 200 * context.frameScale,
                fit: BoxFit.fitHeight,
              ),
              const ScalerGap(12),
              const Reference('https://pub.dev/packages/flutter_shaders'),
            ],
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
次に、公式でも紹介されている flutter_shaders というパッケージを dependencies に追加します。
このパッケージは  Fragment Shader を取り扱う際に、様々な面倒な作業を簡単にできるようにしてくれます。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
