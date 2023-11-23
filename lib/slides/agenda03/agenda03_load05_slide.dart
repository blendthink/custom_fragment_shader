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

final class Agenda03Load05Slide extends SlideStatelessWidget {
  const Agenda03Load05Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
std::string FragmentProgram::initFromAsset(const std::string& asset_name) {
  // ...
  std::unique_ptr<fml::Mapping> data = asset_manager->GetAsMapping(asset_name);
  // ...
  auto runtime_stage = impeller::RuntimeStage(std::move(data));
  //...
  if (UIDartState::Current()->IsImpellerEnabled()) {
    runtime_effect_ = DlRuntimeEffect::MakeImpeller(
        std::make_unique<impeller::RuntimeStage>(std::move(runtime_stage)));
  } else {
    // ...
    runtime_effect_ = DlRuntimeEffect::MakeSkia(result.effect);
  }
  // ...
  Dart_Handle result = Dart_SetField(ths, tonic::ToDart("_samplerCount"),
                                     Dart_NewInteger(sampled_image_count));
  // ...
  result = Dart_SetField(ths, tonic::ToDart("_uniformFloatCount"),
                         Dart_NewInteger(float_count));
  // ...
  return "";
}
// ...''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/ui/painting/fragment_program.cc',
      language: Language.cpp,
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
          'https://github.com/flutter/engine/blob/11d66db97d3f0b010d26441f7ca83c7c3fa1fc67/lib/ui/painting/fragment_program.cc#L29',
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
`AssetManager` の `GetAsMapping()` メソッドで
`asset_name` から `Mapping` データを取得しています。

この `Mapping` データを `RuntimeStage` に移譲して、Impeller が有効かどうかで、異なる `DlRuntimeEffect` を作成しています。
このように、事前に Fragment Shader を読み込んでおいて、すぐに実行できる状態にしているようです。

その後、Fragment Shader に渡す変数の数、を表す値をアプリ側に渡しています。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
