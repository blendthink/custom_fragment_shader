import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04Pixelation04Slide extends SlideStatelessWidget {
  const Agenda04Pixelation04Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
#version 460 core

#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uSize;
uniform float uPixelCount;

uniform sampler2D uTexture;

''';

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
Pixelation に必要なものは３つあります。

１つは、描画する全体のサイズ
２つは、ピクセルブロックの数
最後は、画像データ

です。

Shader が外部から受け取るパラメータを宣言する時は uniform キーワードを使用します。

uniform というキーワードは
Shader がそのフレームで処理する全てのピクセルで、変数の値が同じである
ということを表しています。

慣例として、変数名の先頭に u を付けられることが多いようです。
変数の型について、vec2 と float は馴染みのある方が多いと思いますが
sampler2D は初めて見る方もいるかもしれません。

sampler2D は、２次元の画像を表す型で、dart:ui の Image 型を渡します。

それでは実際の処理を見ていきます。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
