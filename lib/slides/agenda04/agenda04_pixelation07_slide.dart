import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04Pixelation07Slide extends SlideStatelessWidget {
  const Agenda04Pixelation07Slide({super.key});

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
Fragment Shader へ値を渡す方法は、基本的には `setFloat()` メソッドを使用します。
Fragment Shader で `vec2` で定義した値はどうするのかというと、2 つの Float として扱います。

ただし、画像データを渡す場合は `setImageSampler()` メソッドを使用します。

それぞれの第一引数には、Fragment Shader で変数を定義した順番を指定します。
画像データとそれ以外で順番の管理が異なるため注意が必要です。

`AnimatedSampler` のコールバック引数の `image` と `size` には、`child` で指定した `Widget` の画像データとサイズが渡されるようになっているため、これを Fragment Shader に渡します。

そして最後に''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
