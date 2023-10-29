import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/gen/assets.gen.dart';
import 'package:flutter/material.dart';

typedef _Pipeline = (AssetGenImage, String);

const _pipelines = <_Pipeline>[
  (Assets.pipeline01, 'Vertices'),
  (Assets.pipeline02, 'Vertex\nShader'),
  (Assets.pipeline03, 'Primitives\nGeneration'),
  (Assets.pipeline04, 'Rasterization'),
  (Assets.pipeline05, 'Fragment\nShader'),
  (Assets.pipeline06, 'Testing\nBlending'),
  (Assets.pipeline07, 'Framebuffer'),
];

final class RenderingPipelines extends StatelessWidget {
  const RenderingPipelines({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._pipelines
            .map((pipeline) => _RenderingPipeline(pipeline))
            .expand(
              (pipeline) => [
                pipeline,
                const _RenderingPipelineGap(),
              ],
            )
            .take(_pipelines.length * 2 - 1)
      ],
    );
  }
}

final class _RenderingPipeline extends StatelessWidget {
  const _RenderingPipeline(this._pipeline);

  final _Pipeline _pipeline;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.labelSmall;
    final frameScale = context.frameScale;
    final (assetImage, text) = _pipeline;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        assetImage.image(
          height: 82 * frameScale,
          fit: BoxFit.fitHeight,
        ),
        const ScalerGap(12),
        Text(
          text,
          style: textStyle!.copyWith(
            fontSize: textStyle.fontSize! * 0.8,
          ),
        ),
      ],
    );
  }
}

final class _RenderingPipelineGap extends StatelessWidget {
  const _RenderingPipelineGap();

  @override
  Widget build(BuildContext context) {
    final frameScale = context.frameScale;
    return Column(
      mainAxisSize: MainAxisSize.min,
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
  }
}
