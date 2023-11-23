import 'package:custom_fragment_shader/components/reference.dart';
import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda03Run02Slide extends SlideStatelessWidget {
  const Agenda03Run02Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
// ...
class Paint {
  // ...
  @pragma('vm:entry-point')
  List<Object?>? _objects;

  List<Object?> _ensureObjectsInitialized() {
    return _objects ??= List<Object?>.filled(_kObjectCount, null);
  }
  
  static const int _kShaderIndex = 0;
  static const int _kColorFilterIndex = 1;
  static const int _kImageFilterIndex = 2;
  static const int _kObjectCount = 3; // Must be one larger than the largest index.
  // ...
  set shader(Shader? value) {
    // ...
    _ensureObjectsInitialized()[_kShaderIndex] = value;
  }
}
// ...''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/ui/painting.dart',
      language: Language.dart,
      theme: androidStudioTheme,
    );

    final body = Column(
      children: [
        Expanded(
          child: SizedBox(
            height: double.infinity,
            child: codeBlock,
          ),
        ),
        const ScalerGap(16),
        const Reference(
          'https://github.com/flutter/engine/blob/11d66db97d3f0b010d26441f7ca83c7c3fa1fc67/lib/ui/painting.dart#L1090',
        ),
      ],
    );

    return TitleHeaderSlide(
      title: Agenda.agenda03,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
まずは `Paint` クラスの `shader` セッターで何をしているのかみてみます。

`_ensureObjectsInitialized()` メソッドを実行して、`_objects` の指定の位置に Shader をセットしています。

少し特殊な方法で管理していますが、おそらく C++ へ値を受け渡ししやすくするために、このような実装になっているのだと思います。

では、次に `Canvas` クラスの実装をみてみましょう。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
