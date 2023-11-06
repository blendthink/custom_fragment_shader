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

final class Agenda03Load03Slide extends SlideStatelessWidget {
  const Agenda03Load03Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
// ...
base class FragmentProgram extends NativeFieldWrapperClass1 {
  // ...
  static Future<FragmentProgram> fromAsset(String assetKey) {
    // ...
    final String encodedKey = Uri(path: Uri.encodeFull(assetKey)).path;
    final FragmentProgram? program = _shaderRegistry[encodedKey]?.target;
    if (program != null) {
      return Future<FragmentProgram>.value(program);
    }
    return Future<FragmentProgram>.microtask(() {
      final FragmentProgram program = FragmentProgram._fromAsset(encodedKey);
      _shaderRegistry[encodedKey] = WeakReference<FragmentProgram>(program);
      return program;
    });
  }
  // ...
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
`_shaderRegistry` というキャッシュ置き場のようなものがあって、そこに `FragmentProgram` をキャッシュしています。
キャッシュがあればそれを使い、なければ `FragmentProgram` の `_fromAsset()` メソッドを呼び出して
新たに `FragmentProgram` を作成して、その後、キャッシュに保存しています。

`_fromAsset()` メソッドでは何をしているかというと''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
