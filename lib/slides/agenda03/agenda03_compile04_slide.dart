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

final class Agenda03Compile04Slide extends SlideStatelessWidget {
  const Agenda03Compile04Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
// ...
class FlutterBuildSystem extends BuildSystem {
// ...
  @override
  Future<BuildResult> build(
    Target target,
    Environment environment, {
    BuildSystemConfig buildSystemConfig = const BuildSystemConfig(),
  }) async {
    // ...
    final Node node = target._toNode(environment);
    // ...
    try {
      passed = await buildInstance.invokeTarget(node);
    } finally {
      // ...
    }
    // ...
  }
}''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/src/build_system/build_system.dart',
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
          'https://github.com/flutter/flutter/blob/55868ed2a930ce8aa1c046ec9059ca077f807a94/packages/flutter_tools/lib/src/build_system/build_system.dart#L577',
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
ざっくり見てみると `target` から `node` を作り出して `buildInstance` の `invokeTarget()` メソッドを呼び出しているようです。
`invokeTarget()` メソッドのその中身をみてみると''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
