import 'package:custom_fragment_shader/components/agenda04/hologram_effect_frame.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04HologramEffect02Slide extends SlideStatelessWidget {
  const Agenda04HologramEffect02Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const body = Center(
      child: HologramEffectFrame(),
    );

    return const TitleHeaderSlide(
      title: Agenda.agenda04,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
Hologram Effect とは

複雑な光の相互作用によって、存在しない奥行きや空間の錯覚を与え、
2D 表面から 3D イメージを作り出します。

ご覧のように、白色に近い色のみにエフェクトをかけることによって、立体感が発生します。

これを Fragment Shader を使って実装していきましょう。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
