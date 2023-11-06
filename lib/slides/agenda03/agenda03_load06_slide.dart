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

final class Agenda03Load06Slide extends SlideStatelessWidget {
  const Agenda03Load06Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
// ...
base class FragmentProgram extends NativeFieldWrapperClass1 {
  // ...
  @pragma('vm:entry-point')
  late int _uniformFloatCount;

  @pragma('vm:entry-point')
  late int _samplerCount;
  // ...
  FragmentShader fragmentShader() => FragmentShader._(this, debugName: _debugName);
}
// ...
base class FragmentShader extends Shader {
  FragmentShader._(FragmentProgram program, { String? debugName }) : _debugName = debugName, super._() {
    _floats = _constructor(
      program,
      program._uniformFloatCount,
      program._samplerCount,
    );
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
          'https://github.com/flutter/engine/blob/11d66db97d3f0b010d26441f7ca83c7c3fa1fc67/lib/ui/painting.dart#L4502-L4506',
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
アプリ側で受け取っている部分のコードはこちらです。
FragmentProgram クラスのフィールドに設定していることが分かります。

ちなみに、この２つの値は何かというと Fragment Shader に渡す変数の数を表しています。

そして `fragmentShader()` メソッドによって `FragmentShader` クラスのインスタンスを作成して
アプリ側から利用できるようにしています。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
