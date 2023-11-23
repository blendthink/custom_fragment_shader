import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04HologramEffect04Slide extends SlideStatelessWidget {
  const Agenda04HologramEffect04Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
#version 460 core

#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uSize;
uniform float uTime;

uniform sampler2D uTexture;''';

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
Hologram Effect に必要なものは、光沢の変化をどのようにするのかによって様々です。
今回は光沢の変化を時間の変化によって表現しているので、必要なものは

描画する全体のサイズ
経過時間
画像データ

の 3 つです。

角度によって光沢の変化を表現したい場合は、経過時間の代わりに角度を渡すことになります。

それでは実際の処理を見ていきましょう。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
