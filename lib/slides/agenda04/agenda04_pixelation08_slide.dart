import 'package:custom_fragment_shader/components/agenda04/pixelation_frame.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04Pixelation08Slide extends SlideStatelessWidget {
  const Agenda04Pixelation08Slide({super.key});

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
          shader.setFloat(0, size.width);
          shader.setFloat(1, size.height);
          shader.setFloat(2, _pixelCount);
          shader.setImageSampler(0, image);
          canvas.drawRect(
            Offset.zero & size,
            Paint()..shader = shader,
          );
        },
        child: const SpeakerImage(),
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
        const Expanded(
          child: Center(
            child: PixelationFrame(),
          ),
        ),
      ],
    );

    return TitleHeaderSlide(
      title: Agenda.agenda04,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
ピクセル化したい `Widget` を `child` に指定すれば実装完了です。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
