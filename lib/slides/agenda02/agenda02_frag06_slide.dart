import 'package:custom_fragment_shader/components/reference.dart';
import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda02Frag06Slide extends SlideStatelessWidget {
  const Agenda02Frag06Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
#version 460 core

#include <flutter/runtime_effect.glsl>''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'shaders/gradient.frag',
      language: Language.glsl,
      theme: androidStudioTheme,
    );

    const rightCode = '''
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef RUNTIME_EFFECT_GLSL_
#define RUNTIME_EFFECT_GLSL_

#if defined(IMPELLER_GRAPHICS_BACKEND)

// Note: The GLES backend uses name matching for attribute locations. This name
// must match the name of the attribute output in:
// impeller/entity/shaders/runtime_effect.vert
in vec2 _fragCoord;
vec2 FlutterFragCoord() {
  return _fragCoord;
}

#elif defined(SKIA_GRAPHICS_BACKEND)

vec2 FlutterFragCoord() {
  return gl_FragCoord.xy;
}

#else
#error "Runtime effect builtins are not supported for this graphics backend."
#endif

#endif''';
    final rightCodeBlock = HighlightView(
      code: rightCode,
      fileName: 'runtime_effect.glsl',
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
          child: Padding(
            padding: EdgeInsets.all(16 * context.frameScale),
            child: Column(
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: rightCodeBlock,
                  ),
                ),
                const ScalerGap(16),
                const Reference(
                  'https://github.com/flutter/engine/blob/main/impeller/compiler/shader_lib/flutter/runtime_effect.glsl',
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return TitleHeaderSlide(
      title: Agenda.agenda02,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
次に Flutter が提供しているヘルパーをインクルードします。
ヘルパーの中身をみてみると、描画エンジンによって FlutterFragCoord() というメソッドの実装を切り替えていることが分かります。

FragCoord とは Fragment Coordinate の略で Fragment での座標を表しています。
つまり、ある平面上でのどこのピクセルにいるのかということを表しています。

このことからも気づく方がいると思いますが、ここで記述した処理は１つ１つのピクセルごとに実行されます。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
