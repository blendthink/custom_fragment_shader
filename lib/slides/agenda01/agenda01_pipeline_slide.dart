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
レンダリングパイプラインとは、3Dグラフィックスを2Dの表示画面に描画するまでのプロセスを示しています。

Fragment Shader のレンダリングパイプライン上での位置は''';
}
