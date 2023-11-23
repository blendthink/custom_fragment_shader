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

final class Agenda04Pixelation05Slide extends SlideStatelessWidget {
  const Agenda04Pixelation05Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
uniform vec2 uSize;
uniform float uPixelCount;

uniform sampler2D uTexture;

void main() {
    vec2 uv = FlutterFragCoord() / uSize;
    
    vec2 pixels = vec2(uPixelCount);

    vec2 puv = round(uv * pixels) / pixels;
    fragColor = texture(uTexture, puv);
}''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'shaders/pixelation.frag',
      language: Language.glsl,
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
        Expanded(
          child: Center(
            child: Assets.agenda04.uvCoordinates.image(
              height: 200 * context.frameScale,
              fit: BoxFit.fitHeight,
            ),
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
まずはじめに、計算しやすくなるようにピクセル座標を UV 座標へ変換します。
UV 座標とは左上を (0, 0)、右下を (1, 1) とした 01 座標系です。

次に、計算しやすいように、ピクセルブロックの数を `vec2` で表現します。

UV 座標にピクセルブロックの数を掛けて、結果を丸めることでピクセル化を行い
もう一度ピクセルブロックの数で割ることで UV 座標に戻します。

そして、画像から色を取得するために `texture` メソッドを使います。
`texture` メソッドは、第一引数に画像、第二引数に UV 座標を設定して、画像のどのピクセルの色を取得するかを決定します。

これで Pixelation の Fragment Shader の実装は完了です。
次にアプリ側で Fragment Shader を呼び出す部分の実装をしていきます。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
