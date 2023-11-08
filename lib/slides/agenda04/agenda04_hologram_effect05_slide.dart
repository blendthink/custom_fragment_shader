import 'package:custom_fragment_shader/components/agenda04/hologram_effect_frame.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04HologramEffect05Slide extends SlideStatelessWidget {
  const Agenda04HologramEffect05Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
uniform vec2 uSize;
uniform float uTime;

uniform sampler2D uTexture;
// ...
void main() {
    vec2 uv = FlutterFragCoord() / uSize;
    vec3 texColor = texture(uTexture, uv).rgb;

    vec2 rotatedUV = rotateUV(uv, 45);
    vec3 rainbowColor = getRainbowColor(rotatedUV, uTime);
    float glossIntensity = getGlossIntensity(rotatedUV, uTime);
    vec3 glossColor = getGlossColor(texColor, rainbowColor, glossIntensity);

    vec3 hologramColor = mix(texColor, texColor + glossColor, 0.5);
    fragColor = vec4(hologramColor, 1.0);
}''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'shaders/hologram_effect.frag',
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
        const Expanded(
          child: Center(
            child: HologramEffectFrame(),
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
全てを説明すると時間が足りなくなってしまうため全体の流れだけ説明します。

UV 座標に変換して、ピクセル部分の画像の色を取得します。
今回はアルファ値は使用しないので、RGB のみを取得します。

次に、UV 座標を回転させて、経過時間による色の変化の向きに合わせます。
その後、回転させた UV 座標と経過時間からピクセル部分の虹色と光沢度を計算して取得します。

そして、画像の色と虹色と光沢度から、光沢色を計算して取得します。

最後に、画像の色と光沢色を混ぜ合わせて、ホログラムの色を計算して取得します。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
