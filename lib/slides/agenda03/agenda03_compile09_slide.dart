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

final class Agenda03Compile09Slide extends SlideStatelessWidget {
  const Agenda03Compile09Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
// ...
Future<Depfile> copyAssets(
  // ...
}) async {
  // ...
  final File pubspecFile =  environment.projectDir.childFile('pubspec.yaml');
  // ...
  await Future.wait<void>(
    assetEntries.entries.map<Future<void>>((MapEntry<String, DevFSContent> entry) async {
      // ...
      try {
        if (content is DevFSFileContent && content.file is File) {
          // ...
          switch (assetKind) {
            // ...
            case AssetKind.shader:
              doCopy = !await shaderCompiler.compileShader(
                input: content.file as File,
                outputPath: file.path,
                target: shaderTarget,
                json: targetPlatform == TargetPlatform.web_javascript,
              );
          }
        }
      }
      //...
  }));
  // ...      
}
// ...''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/src/build_system/targets/assets.dart',
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
          'https://github.com/flutter/flutter/blob/55868ed2a930ce8aa1c046ec9059ca077f807a94/packages/flutter_tools/lib/src/build_system/targets/assets.dart#L29',
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
`pubspec.yaml` を解析してアセット情報を取り出して
それぞれのアセット情報ごとに適切な処理をするようになっています。

Shader の場合は `ShaderCompiler` の `compileShader()` メソッドを呼び出していることが分かります。
ここで Shader をコンパイルして、指定した場所に出力しているようです。

念の為 `ShaderCompiler` の実装を確認してみると''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
