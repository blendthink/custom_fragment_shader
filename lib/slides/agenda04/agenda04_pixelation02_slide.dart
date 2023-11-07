import 'package:custom_fragment_shader/components/agenda04/pixelation_frame.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/gen/assets.gen.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04Pixelation02Slide extends SlideStatelessWidget {
  const Agenda04Pixelation02Slide({super.key});

  @override
  Widget build(BuildContext context) {
    final imageRadius = 100 * context.frameScale;
    final arrowSize = 100 * context.frameScale;
    final body = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundImage: Assets.speaker.image().image,
            radius: imageRadius,
          ),
          Icon(
            Icons.arrow_right_alt,
            size: arrowSize,
          ),
          const PixelationFrame(),
        ],
      ),
    );

    return TitleHeaderSlide(
      title: Agenda.agenda04,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
Pixelation とは、ご覧のように画像をピクセル化することです。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
