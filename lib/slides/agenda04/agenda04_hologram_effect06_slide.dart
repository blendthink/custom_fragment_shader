import 'package:custom_fragment_shader/components/agenda04/gloss_effect_frame.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04HologramEffect06Slide extends SlideStatelessWidget {
  const Agenda04HologramEffect06Slide({super.key});

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

    fragColor = vec4(glossColor, 1.0);
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
            child: GlossEffectFrame(),
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
ご覧のように元の画像の色がなくなってしまいます。

アプリ側で Fragment Shader を呼び出す部分の実装については、経過時間を渡す部分以外、これまでと同じなので省略します。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
