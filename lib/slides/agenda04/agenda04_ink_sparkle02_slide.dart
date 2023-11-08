import 'package:custom_fragment_shader/components/agenda04/ink_sparkle_frame.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04InkSparkle02Slide extends SlideStatelessWidget {
  const Agenda04InkSparkle02Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const body = Center(
      child: InkSparkleFrame(),
    );

    return const TitleHeaderSlide(
      title: Agenda.agenda04,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
Ink Sparkle とは


''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
