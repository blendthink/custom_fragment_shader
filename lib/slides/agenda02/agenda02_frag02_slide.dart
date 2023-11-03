import 'package:custom_fragment_shader/components/agenda02/gradient_frame.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda02Frag02Slide extends SlideStatelessWidget {
  const Agenda02Frag02Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'shaders/gradient.frag',
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
            child: SizedBox.square(
              dimension: 160 * context.frameScale,
              child: const GradientFrame(),
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
２つの色を使ってグラデーションを描画する Fragment Shader を作成するので
gradient.frag という名前にします。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
