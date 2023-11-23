import 'package:custom_fragment_shader/components/agenda04/pixelation_frame.dart';
import 'package:custom_fragment_shader/components/agenda04/speaker_image.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04Pixelation02Slide extends SlideStatelessWidget {
  const Agenda04Pixelation02Slide({super.key});

  @override
  Widget build(BuildContext context) {
    final arrowSize = 80 * context.frameScale;
    final body = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SpeakerImage(),
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
Pixelation とは、ご覧のように、画像をより大きなピクセルのブロックに分割して、それぞれのピクセルの色を平均化することです。

これを Fragment Shader を使って実装していきましょう。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
