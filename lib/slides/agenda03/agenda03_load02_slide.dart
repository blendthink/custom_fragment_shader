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
class ShaderBuilder extends StatefulWidget {
  // ...
}

class _ShaderBuilderState extends State<ShaderBuilder> {
  // ...
  @override
  void initState() {
    super.initState();
    _loadShader(widget.assetKey);
  }

  // ...
  void _loadShader(String assetKey) {
    if (_shaderCache.containsKey(assetKey)) {
      program = _shaderCache[assetKey];
      shader = program!.fragmentShader();
      return;
    }

    ui.FragmentProgram.fromAsset(assetKey).then((ui.FragmentProgram program) {
      if (!mounted) {
        return;
      }
      setState(() {
        this.program = program;
        shader = program.fragmentShader();
        _shaderCache[assetKey] = program;
      });
    }, onError: (Object error, StackTrace stackTrace) {
      FlutterError.reportError(
          FlutterErrorDetails(exception: error, stack: stackTrace));
    });
  }
  // ...
}''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/src/shader_builder.dart',
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
          'https://github.com/jonahwilliams/flutter_shaders/blob/be68f3470a1c2452662d80910955dccb29c89f7b/lib/src/shader_builder.dart#L39',
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
`ShaderBuilder` は `StatefulWidget` なので、`State` に値する `_ShaderBuilderState` というクラスがあります。

この State の `initState()` メソッドで `_loadShader()` メソッドを呼び出しており、
Shader のキャッシュがあればそれを使い、なければ `FragmentProgram` の `fromAsset()` メソッドを呼び出しています。
そして、Shader のロードが完了したら、その Shader をキャッシュしています。

この `FragmentProgram` の `fromAsset()` メソッドの中身をもう少し見ていきます。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
