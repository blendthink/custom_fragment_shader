import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04Transition08Slide extends SlideStatelessWidget {
  const Agenda04Transition08Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
Widget _transitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return ShaderBuilder(
    assetKey: 'shaders/transition.frag',
    (context, shader, _) {
      return AnimatedSampler(
        (image, size, canvas) {
          shader.setFloat(0, size.width);
          shader.setFloat(1, size.height);
          shader.setFloat(2, animation.value);
          shader.setImageSampler(0, image);
          canvas.drawRect(
            Offset.zero & size,
            Paint()..shader = shader,
          );
        },
        child: child,
      );
    },
  );
}''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'transition.dart',
      language: Language.dart,
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
`transitionsBuilder` 部分はご覧のように実装します。
これまでとほとんど変わらず、それぞれ必要な値を設定するだけです。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
