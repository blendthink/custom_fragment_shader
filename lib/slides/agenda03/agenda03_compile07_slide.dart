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

final class Agenda03Compile07Slide extends SlideStatelessWidget {
  const Agenda03Compile07Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
// ...
List<Target> _kDefaultTargets = <Target>[
  // ...
  const DebugMacOSBundleFlutterAssets(),
  const ProfileMacOSBundleFlutterAssets(),
  const ReleaseMacOSBundleFlutterAssets(),
  // ...
];
// ...''';

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
          'https://github.com/flutter/flutter/blob/55868ed2a930ce8aa1c046ec9059ca077f807a94/packages/flutter_tools/lib/src/commands/assemble.dart#L30',
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
様々な `Target` が定義されています。
その中に `Assets` に関連する名前がついた `Target` がいくつかあります。

個人的に MacOS アプリを直近でビルドしていたので、`DebugMacOSBundleFlutterAssets` の中身を確認してみます。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
