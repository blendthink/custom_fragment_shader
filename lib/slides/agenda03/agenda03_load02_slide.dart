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

final class Agenda03Load02Slide extends SlideStatelessWidget {
  const Agenda03Load02Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
// ...
class AssembleCommand extends FlutterCommand {
  // ...
  @override
  Future<FlutterCommandResult> runCommand() async {
    final List<Target> targets = createTargets();
    // ...
    final BuildResult result = await _buildSystem.build(
      target!,
      _environment,
      buildSystemConfig: BuildSystemConfig(
        resourcePoolSize: argumentResults.wasParsed('resource-pool-size')
          ? int.tryParse(stringArg('resource-pool-size')!)
          : null,
      ),
    );
    // ...
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
          'https://github.com/flutter/flutter/blob/55868ed2a930ce8aa1c046ec9059ca077f807a94/packages/flutter_tools/lib/src/commands/assemble.dart#L278',
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
中身をみてみると、`assemble` コマンドはまずターゲットと呼ばれるものを作成して
それらをゴニョゴニョして `BuildSystem` の `build()` メソッドを呼び出していることが分かります。

`BuildSystem` は何かというと `AssembleCommand` のコンストラクタが呼び出されているところを確認する必要があります。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
