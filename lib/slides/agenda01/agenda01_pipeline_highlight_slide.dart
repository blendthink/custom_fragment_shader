import 'package:custom_fragment_shader/components/agenda01/rendering_pipelines.dart';
import 'package:custom_fragment_shader/components/reference.dart';
import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';

final class Agenda01PipelineHighlightSlide extends SlideStatelessWidget {
  const Agenda01PipelineHighlightSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final body = Column(
      children: [
        const ScalerGap(24),
        Text(
          'The Rendering Pipeline',
          style: theme.textTheme.titleMedium,
        ),
        const ScalerGap(36),
        const RenderingPipelines(
          isHighlight: true,
        ),
        const ScalerGap(36),
        const Reference('https://glumpy.github.io/modern-gl.html'),
      ],
    );

    return TitleHeaderSlide(
      title: Agenda.agenda01,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
Fragment Shader のレンダリングパイプライン上での位置は赤枠で囲われた部分です。

順に流れを見ていくと

3Dオブジェクトの頂点情報を準備して Vertex Shader で、3Dオブジェクトの頂点の位置を画面上の位置に変換します。カメラの位置などによって、頂点の位置が変わります。
次に、Primitives Generation で、頂点はプリミティブ（例：三角形）にグループ化されます。
その後、ラスタライズ化を行い、プリミティブはピクセルに変換されます。
ピクセル情報へ変換後、Fragment Shader で各ピクセルの色や他の属性を計算します。
そして、どのピクセルが前面に表示されるかの深度テストや半透明などの効果のブレンディングが行われます。
最後に、計算されたピクセルがフレームバッファに書き込まれ、ディスプレイに表示されます。

つまり、Fragment Shader は画面表示するまでの最後の方の処理で、とても重要な処理です。
''';
}
