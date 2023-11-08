import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04InkSparkle02Slide extends SlideStatelessWidget {
  const Agenda04InkSparkle02Slide({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final body = Center(
      child: SizedBox(
        width: 400 * context.frameScale,
        height: 200 * context.frameScale,
        child: TextButton(
          style: TextButton.styleFrom(splashFactory: InkSparkle.splashFactory),
          onPressed: () {},
          child: Text(
            'Sparkle!',
            style: textTheme.displayLarge,
          ),
        ),
      ),
    );

    return TitleHeaderSlide(
      title: Agenda.agenda04,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
Ink Sparkle とは、ご覧のようにタップした時に輝いているような波紋を表示するエフェクトです。

これは、Android 12　から Material 3 が有効の際にデフォルトで有効になるということが判明して
Flutter でもこのエフェクトに対応したいということで導入されました。

Flutter では Fragment Shader を使ってこのエフェクトを実現しています。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
