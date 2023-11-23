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

final class Agenda03Compile06Slide extends SlideStatelessWidget {
  const Agenda03Compile06Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
// ...
class AssembleCommand extends FlutterCommand {
  // ...
  List<Target> createTargets() {
    // ...
    final Map<String, Target> targetMap = <String, Target>{
      for (final Target target in _kDefaultTargets)
        target.name: target,
    };
    final List<Target> results = <Target>[
      for (final String targetName in argumentResults.rest)
        if (targetMap.containsKey(targetName))
          targetMap[targetName]!,
    ];
    // ...
    return results;
  }
}''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/src/commands/assemble.dart',
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
          'https://github.com/flutter/flutter/blob/55868ed2a930ce8aa1c046ec9059ca077f807a94/packages/flutter_tools/lib/src/commands/assemble.dart#L168',
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
`target` は `createTargets()` メソッドで作成されていて

どうやら、`_kDefaultTargets` という変数を元に `Target` を作成しているようです。

`_kDefaultTargets` の中身を確認すると''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
