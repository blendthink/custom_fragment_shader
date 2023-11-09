import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04Transition07Slide extends SlideStatelessWidget {
  const Agenda04Transition07Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
const _transitionDuration = Duration(seconds: 1);

class DotsCurtainTransitionPage<T> extends CustomTransitionPage<T> {
  const DotsCurtainTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(
          transitionsBuilder: _transitionsBuilder,
          transitionDuration: _transitionDuration,
          reverseTransitionDuration: _transitionDuration,
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
アプリ側の実装方法もいくつか方法があると思いますが、今回は
go_router の CustomTransitionPage を使った方法をご紹介いたします。

まずは CustomTransitionPage というカスタマイズ用のクラスを継承したクラスを作成します。
ここでは遷移アニメーションの時間は 1 秒に設定しています。

次に transitionsBuilder 部分を実装すれば完了です。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
