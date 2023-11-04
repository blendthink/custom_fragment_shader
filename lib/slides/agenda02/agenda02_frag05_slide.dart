import 'package:custom_fragment_shader/components/reference.dart';
import 'package:custom_fragment_shader/components/scaler_gap.dart';
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

final class Agenda02Frag05Slide extends SlideStatelessWidget {
  const Agenda02Frag05Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
#version 460 core''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'shaders/orange.frag',
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.agenda02.glslProfiles.image(
                height: 100 * context.frameScale,
                fit: BoxFit.fitHeight,
              ),
              const ScalerGap(24),
              const Reference(
                'https://registry.khronos.org/OpenGL/specs/gl/GLSLangSpec.4.60.html#source-strings',
              ),
            ],
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
profile は次の３つから選択します。
今回は core を選択します。
使用する GLSL のバージョンによっても選択できる profile が変わりますので、ご注意ください。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
