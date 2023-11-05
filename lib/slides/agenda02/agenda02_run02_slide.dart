import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda02Run02Slide extends SlideStatelessWidget {
  const Agenda02Run02Slide({super.key});

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
        return AnimatedSampler(
          (image, size, canvas) {
            canvas.drawRect(
              Offset.zero & size,
              Paint()..shader = shader,
            );
          },
          child: const SizedBox.shrink(),
        );
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
描画処理は AnimatedSampler の builder の引数として渡ってくる canvas を使って実装します。
canvas には、描画するためのメソッドがいくつか用意されていますが、Fragment Shader では drawRect を使うことが多いと思います。

drawRect の第一引数では描画する領域を指定して、第二引数では描画するための Paint を指定します。

Offset.zero & size の意味は、Rect.fromLTWH(0, 0, size.width, size.height) と同じ意味です。
このように Offset には便利な Operator が用意されているので、& を使って簡単に Rect を作成できます。

Paint には、shader というプロパティがあるので、そこに ShaderBuilder から渡される shader を設定します。
これで大体アプリで実行する部分の実装は完了です。
あとは、アプリに組み込んで動かしてみましょう。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
