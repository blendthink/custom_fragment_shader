import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04Transition09Slide extends SlideStatelessWidget {
  const Agenda04Transition09Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: routes.first.path,
  routes: [
    GoRoute(
      path: '/demo',
      pageBuilder: (context, state) => DotsCurtainTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: DemoPage(),,
      ),
    ),
  ],
);
''';

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
あとはご覧のように、`GoRoute` クラスの `pageBuilder` に設定するだけです。

これで Transition Animation の実装は完了です。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
