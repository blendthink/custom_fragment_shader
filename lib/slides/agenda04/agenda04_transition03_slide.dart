import 'package:custom_fragment_shader/components/agenda04/speaker_image.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04Transition03Slide extends SlideStatelessWidget {
  const Agenda04Transition03Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const body = Center(
      child: SpeakerImage(),
    );

    return const ColoredBox(
      color: Colors.green,
      child: TitleHeaderSlide(
        title: Agenda.agenda04,
        body: body,
      ),
    );
  }

  @override
  String get speakerNote => '''
ご覧のような遷移アニメーションを簡単に実装することができます。

では、どのように実装していくのか見ていきましょう。''';

  @override
  GoRouterPageBuilder get pageBuilder =>
      (context, state) => DotsCurtainTransitionPage(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: this,
          );
}
