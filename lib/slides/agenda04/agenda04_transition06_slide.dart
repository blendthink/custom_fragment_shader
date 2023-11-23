import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04Transition06Slide extends SlideStatelessWidget {
  const Agenda04Transition06Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
const float SQRT_2 = 1.414213562373;
const float dots = 40.0;
const vec2 center = vec2(0, 0);

vec4 transition(vec2 uv) {
    bool nextImage = distance(fract(uv * dots), vec2(0.5, 0.5)) < (uProgress / distance(uv, center));
    return nextImage ? texture(uTexture, uv) : vec4(0.0);
}

void main() {
    vec2 uv = FlutterFragCoord() / uSize;
    fragColor = transition(uv);
}''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'shaders/transition.frag',
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
メイン部分の実装はこれだけです。

まず UV 座標に変換して、楕円形のドットの大きさを進捗状況によって変化させて
その楕円形のドットの中心からの距離と UV 座標とアニメーションのスタート位置からの距離を比較して
現在の画像を表示するのか、次の画像を表示するのかを決定しています。

次にアプリ側の実装方法を見ていきましょう。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
