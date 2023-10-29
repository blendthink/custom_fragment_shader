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

まず、3Dオブジェクトの頂点情報を準備して Vertex Shader で、3Dオブジェクトの頂点の位置を画面上の位置に変換します。
なぜ、このような処理をしているかというと、3Dオブジェクトはカメラの位置・視点などによって、平面上での頂点の位置が変わってくるためです。

次に、頂点は三角形などのプリミティブにグループ化されます。
その後、ラスタライズ化を行い、プリミティブはピクセルに変換され、画面上のどのピクセルがプリミティブに影響されるかが決まります。

ピクセルへ変換後、Fragment Shader で各ピクセルの色や他の属性を計算します。
（テクスチャマッピング、光の反射、陰影、透明度などのエフェクト）

そして、どのピクセルが前面に表示されるかの深度テストや半透明などの効果のブレンディングが行われます。
最後に、計算されたピクセルがフレームバッファに書き込まれ、ディスプレイに表示されます。

これらの処理を GPU 上で行うことで、高速に描画することができます。
''';
}
