import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04Transition05Slide extends SlideStatelessWidget {
  const Agenda04Transition05Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
#version 460 core

#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uSize;
uniform float uProgress;

uniform sampler2D uTexture;

const float SQRT_2 = 1.414213562373;
const float dots = 40.0;
const vec2 center = vec2(0, 0);

''';

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
今回の Transition Animation に必要なものは３つあります。

１つは、描画する全体のサイズ
２つは、0-1 の進行状況
最後は、画像データ

です。

そして、ルート２の値と、ドットの数、アニメーションのスタート位置を定義しています。
最後にメインの実装部分を見ていきます。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
