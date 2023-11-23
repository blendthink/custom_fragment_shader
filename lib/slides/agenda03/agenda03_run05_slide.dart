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

final class Agenda03Run05Slide extends SlideStatelessWidget {
  const Agenda03Run05Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
// ...
Paint::Paint(Dart_Handle paint_objects, Dart_Handle paint_data)
    : paint_objects_(paint_objects), paint_data_(paint_data) {}

const DlPaint* Paint::paint(DlPaint& paint,
                            const DisplayListAttributeFlags& flags) const {
    // ...
    if (flags.applies_shader()) {
      Dart_Handle shader = values[kShaderIndex];
      if (Dart_IsNull(shader)) {
        // ...
      } else {
        if (Shader* decoded = tonic::DartConverter<Shader*>::FromDart(shader)) {
          auto sampling =
              ImageFilter::SamplingFromIndex(uint_data[kFilterQualityIndex]);
          paint.setColorSource(decoded->shader(sampling));
        } else {
          paint.setColorSource(nullptr);
        }
      }
    }
    // ...
}
// ...''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/ui/painting/paint.cc',
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
          'https://github.com/flutter/engine/blob/555ffa17b55c38b7fa4c203c66ec673c3785d380/lib/ui/painting/paint.cc#L61',
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
`Paint` クラスのコンストラクタでは、メンバイニシャライザという方法で、クラスのメンバ変数へ各値を代入しています。

その下の `paint()` メソッドでは Shader を適用するフラグが立っていたら、Shader を扱いやすい形式にデコードして、フィルターの品質を取得してそれも合わせたものを `Paint` の `ColorSource` に設定しています。

このように描画の設定をしたものを先ほどの''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
