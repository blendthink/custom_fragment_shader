import 'package:custom_fragment_shader/components/agenda01/rendering_pipelines.dart';
import 'package:custom_fragment_shader/components/reference.dart';
import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';

final class Agenda01PipelineSlide extends SlideStatelessWidget {
  const Agenda01PipelineSlide({super.key});

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
          isHighlight: false,
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
Fragment Shader とは、レンダリングパイプラインの一部で、各ピクセルの色や他の属性を計算するためのコンピュータプログラムです。

Vertices: 3Dオブジェクトは頂点で構成されています。このステップでは、これらの頂点がCPUによって生成されます。
Vertex Shader: 頂点シェーダはGPU上で動作し、各頂点の位置や色などの属性を変更することができます。
Primitives Generation: このステップで、頂点はプリミティブ（例：三角形）にグループ化されます。
Rasterization: プリミティブはピクセルに変換される過程です。これにより、画面上のどのピクセルがプリミティブに影響されるかが決まります。
Fragment Shader: 各ピクセル（またはフラグメント）の最終的な色や他の属性を計算します。
Testing Blending: このステップでは、深度テスト（どのピクセルが前面に表示されるか）やブレンディング（半透明などの効果）が行われます。
Framebuffer: 最後に、計算されたピクセルがフレームバッファに書き込まれ、ディスプレイに表示されます。
''';
}
