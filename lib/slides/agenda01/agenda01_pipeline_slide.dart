import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/gen/assets.gen.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';

const _pipelines = <(AssetGenImage, String)>[
  (Assets.pipeline01, 'Vertices'),
  (Assets.pipeline02, 'VerTex\nShader'),
  (Assets.pipeline03, 'Primitives\nGeneration'),
  (Assets.pipeline04, 'Rasterization'),
  (Assets.pipeline05, 'Fragment\nShader'),
  (Assets.pipeline06, 'Testing\nBlending'),
  (Assets.pipeline07, 'Framebuffer'),
];

final class Agenda01PipelineSlide extends SlideStatelessWidget {
  const Agenda01PipelineSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final frameScale = context.frameScale;
    final body = Column(
      children: [
        const ScalerGap(24),
        Text(
          'The Rendering Pipeline',
          style: theme.textTheme.titleMedium,
        ),
        const ScalerGap(36),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final (assetImage, text) = _pipelines[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    assetImage.image(
                      width: 68 * frameScale,
                      fit: BoxFit.fitWidth,
                    ),
                    const ScalerGap(12),
                    Text(
                      text,
                      style: textTheme.labelSmall?.copyWith(
                        fontSize: textTheme.labelSmall!.fontSize! * 0.8,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Column(
                  children: [
                    const ScalerGap(32),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2 * frameScale,
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        size: 16 * frameScale,
                      ),
                    ),
                  ],
                );
              },
              itemCount: _pipelines.length,
            ),
          ),
        ),
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
