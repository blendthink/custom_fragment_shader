import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda02GlslAnimationSlide extends StatefulWidget
    implements SlideWidget {
  const Agenda02GlslAnimationSlide({super.key});

  @override
  State<Agenda02GlslAnimationSlide> createState() => _State();

  @override
  String get speakerNote => '''
GLSL とは OpenGL Shading Language の略で、
OpenGL で使用できる Shader 向けのプログラミング言語です。
ちなみに OpenGL は Open Graphics Library の略です。

それでは早速 Fragment Shader を書いていきましょう。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}

class _State extends State<Agenda02GlslAnimationSlide> {
  bool _first = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          if (!mounted) return;
          setState(() {
            _first = false;
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final abbrTextStyle = textTheme.headlineLarge?.copyWith(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w900,
    );

    final body = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _CrossFadeText(
            text: 'Open',
            first: _first,
          ),
          Text(
            'GL',
            style: abbrTextStyle,
          ),
          _CrossFadeText(
            text: ' ',
            first: _first,
          ),
          Text(
            'S',
            style: abbrTextStyle,
          ),
          _CrossFadeText(
            text: 'hading ',
            first: _first,
          ),
          Text(
            'L',
            style: abbrTextStyle,
          ),
          _CrossFadeText(
            text: 'anguage',
            first: _first,
          ),
        ],
      ),
    );

    return TitleHeaderSlide(
      title: Agenda.agenda02,
      body: body,
    );
  }
}

final class _CrossFadeText extends StatelessWidget {
  const _CrossFadeText({
    required String text,
    required bool first,
  })  : _text = text,
        _first = first;

  final String _text;
  final bool _first;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fullTextStyle = theme.textTheme.headlineMedium?.copyWith(
      fontWeight: FontWeight.w100,
    );
    return AnimatedCrossFade(
      firstChild: const SizedBox.shrink(),
      secondChild: Text(
        _text,
        style: fullTextStyle,
      ),
      crossFadeState:
          _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(seconds: 1),
    );
  }
}
