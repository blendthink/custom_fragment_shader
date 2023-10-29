import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/gen/assets.gen.dart';
import 'package:flutter/material.dart';

typedef _Pipeline = (AssetGenImage, String);

final _pipelines = <_Pipeline>[
  (Assets.agenda01.pipeline01, 'Vertices'),
  (Assets.agenda01.pipeline02, 'Vertex\nShader'),
  (Assets.agenda01.pipeline03, 'Primitives\nGeneration'),
  (Assets.agenda01.pipeline04, 'Rasterization'),
  (Assets.agenda01.pipeline05, 'Fragment\nShader'),
  (Assets.agenda01.pipeline06, 'Testing\nBlending'),
  (Assets.agenda01.pipeline07, 'Framebuffer'),
];

final class RenderingPipelines extends StatelessWidget {
  const RenderingPipelines({
    required bool isHighlight,
    super.key,
  }) : _isHighlight = isHighlight;

  final bool _isHighlight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._pipelines
            .map(
              (pipeline) => _RenderingPipeline(
                pipeline: pipeline,
                isHighlight: _isHighlight,
              ),
            )
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
  const _RenderingPipeline({
    required bool isHighlight,
    required _Pipeline pipeline,
  })  : _isHighlight = isHighlight,
        _pipeline = pipeline;

  final bool _isHighlight;
  final _Pipeline _pipeline;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.labelSmall;
    final frameScale = context.frameScale;
    final (assetImage, text) = _pipeline;

    final isFragmentShader = assetImage == Assets.agenda01.pipeline05;
    final shouldHighlight = _isHighlight && isFragmentShader;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: shouldHighlight ? Colors.pinkAccent : Colors.transparent,
          width: 4 * context.frameScale,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: Column(
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
      ),
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
