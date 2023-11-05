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

final class Agenda03Compile08Slide extends SlideStatelessWidget {
  const Agenda03Compile08Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
abstract class MacOSBundleFlutterAssets extends Target {
  // ...
  @override
  Future<void> build(Environment environment) async {
    // ...
    final Directory assetDirectory = outputDirectory
      .childDirectory('Resources')
      .childDirectory('flutter_assets');
    assetDirectory.createSync(recursive: true);

    final Depfile assetDepfile = await copyAssets(
      environment,
      assetDirectory,
      targetPlatform: TargetPlatform.darwin,
      shaderTarget: ShaderTarget.sksl,
    );
    // ...
  }
}
// ...
class DebugMacOSBundleFlutterAssets extends MacOSBundleFlutterAssets {
  // ...
}
// ...''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/src/build_system/targets/macos.dart',
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
          'https://github.com/flutter/flutter/blob/55868ed2a930ce8aa1c046ec9059ca077f807a94/packages/flutter_tools/lib/src/build_system/targets/macos.dart#L531',
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
`DebugMacOSBundleFlutterAssets` は `MacOSBundleFlutterAssets` を継承していて
それの `build()` メソッドが呼ばれていました。

実装を確認すると、アセット用の出力先のディレクトリを作成して
`copyAssets()` というメソッドを呼び出していることが分かります。

この `copyAssets()` メソッドの中身を確認してみると''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
