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

final class Agenda03Compile10Slide extends SlideStatelessWidget {
  const Agenda03Compile10Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
// ...
class ShaderCompiler {
  // ...
  Future<bool> compileShader({
    // ...
  }) async {
    final File impellerc = _fs.file(
      _artifacts.getHostArtifact(HostArtifact.impellerc),
    );
    // ...
    final List<String> cmd = <String>[
      impellerc.path,
      target.target,
      // ...
    ];
    final Process impellercProcess = await _processManager.start(cmd);
    // ...
    return true;
  }
}
// ...''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/src/build_system/targets/shader_compiler.dart',
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
          'https://github.com/flutter/flutter/blob/55868ed2a930ce8aa1c046ec9059ca077f807a94/packages/flutter_tools/lib/src/build_system/targets/shader_compiler.dart#L160C31-L160C31',
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
プラットフォームによって異なる impellerc という実行ファイルを取得して、引数を指定して実行していました。

これによって、プラットフォームによって、シェーダーが適切にコンパイルされ
必要なランタイムメタデータを自動的に生成されます。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
