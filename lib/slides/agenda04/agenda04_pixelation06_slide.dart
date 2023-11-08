import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04Pixelation06Slide extends SlideStatelessWidget {
  const Agenda04Pixelation06Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
const _pixelCount = 20.0;

final class PixelationFrame extends StatelessWidget {
  const PixelationFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: 'shaders/pixelation.frag',
      (context, shader, child) => AnimatedSampler(
        (image, size, canvas) {
          
          
          
          
          canvas.drawRect(
            Offset.zero & size,
            Paint()..shader = shader,
          );
        },
        child: const SizedBox.shrink(),
      ),
    );
  }
}''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'pixelation_frame.dart',
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
      title: Agenda.agenda04,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
まず、どのくらいのピクセルブロックに分割するかを定数として定義します。
今回はいったん 20 で定義しておきます。

その後、以前と同様に必要なものを用意します。

あとは、Fragment Shader へ必要なものを渡す部分の実装をすれば完了です。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
