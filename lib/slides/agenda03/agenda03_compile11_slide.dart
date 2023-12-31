import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda03Compile11Slide extends SlideStatelessWidget {
  const Agenda03Compile11Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
IPLR
    ÑD7// This SkSL shader is autogenerated by spirv-cross.

float4 flutter_FragCoord;

vec4 fragColor;

void FLT_main()
{
    fragColor = vec4(1.0, 0.64999997615814208984375, 0.0, 1.0);
}

half4 main(float2 iFragCoord)
{
      flutter_FragCoord = float4(iFragCoord, 0, 0);
      FLT_main();
      return fragColor;
}
7// This SkSL shader is autogenerated by spirv-cross.

float4 flutter_FragCoord;

vec4 fragColor;

void FLT_main()
{
    fragColor = vec4(1.0, 0.64999997615814208984375, 0.0, 1.0);
}

half4 main(float2 iFragCoord)
{
      flutter_FragCoord = float4(iFragCoord, 0, 0);
      FLT_main();
      return fragColor;
}
orange_fragment_main''';

    final codeBlock = HighlightView(
      code: code,
      fileName:
          'build/macos/Build/Products/Debug/App.framework/Versions/A/Resources/flutter_assets/shaders/orange.frag',
      language: Language.glsl,
      theme: androidStudioTheme,
    );

    final body = Center(
      child: SizedBox(
        height: double.infinity,
        child: codeBlock,
      ),
    );

    return TitleHeaderSlide(
      title: Agenda.agenda03,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
ご覧のようになっていました。

どうやら MacOS アプリでは SkSL Shader が生成されるようです。

これで `pubspec.yaml` に `shaders` を追加することで、何が起こるのかが分かりました。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
