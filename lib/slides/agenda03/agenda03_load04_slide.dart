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

final class Agenda03Load04Slide extends SlideStatelessWidget {
  const Agenda03Load04Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
// ...
base class FragmentProgram extends NativeFieldWrapperClass1 {
  @pragma('vm:entry-point')
  FragmentProgram._fromAsset(String assetKey) {
    _constructor();
    final String result = _initFromAsset(assetKey);
    if (result.isNotEmpty) {
      throw Exception(result);
    }
    // ...
  }
  // ...
  @Native<Void Function(Handle)>(symbol: 'FragmentProgram::Create')
  external void _constructor();

  @Native<Handle Function(Pointer<Void>, Handle)>(symbol: 'FragmentProgram::initFromAsset')
  external String _initFromAsset(String assetKey);
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
          'https://github.com/flutter/engine/blob/11d66db97d3f0b010d26441f7ca83c7c3fa1fc67/lib/ui/painting.dart#L4457',
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
`_constructor()` メソッドを呼び出して、`_initFromAsset()` メソッドを呼び出しています。

どちらも ffi を使って C++ の関数を呼び出しています。
`_initFromAsset()` メソッドの中身を少し覗いてみると''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
