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
import 'src/globals.dart' as globals;
// ...
List<FlutterCommand> generateCommands({
  required bool verboseHelp,
  required bool verbose,
}) => <FlutterCommand>[
  // ...
  AssembleCommand(verboseHelp: verboseHelp, buildSystem: globals.buildSystem),
  // ...
];
// ...''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/executable.dart',
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
          'https://github.com/flutter/flutter/blob/55868ed2a930ce8aa1c046ec9059ca077f807a94/packages/flutter_tools/lib/executable.dart#L141',
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
確認してみると、`globals` の `buildSystem` が渡されていることが分かります。
`globals` の `buildSystem` は何かというと `FlutterBuildSystem` というクラスのインスタンスです。
なぜそうなるかは、時間の関係上省略させていただきます。

では、`FlutterBuildSystem` の `build()` メソッドでは何をしているのかを確認してみましょう。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
