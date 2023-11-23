import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04Pixelation03Slide extends SlideStatelessWidget {
  const Agenda04Pixelation03Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
#version 460 core

#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

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
まずは、Fragment Shader の実装からです。

必須のものを書いて、次に、Pixelation に必要なものを書いていきます。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
