import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/gen/assets.gen.dart';
import 'package:flutter/material.dart';

final class SpeakerLabel extends StatelessWidget {
  const SpeakerLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 16 * context.frameScale,
          backgroundImage: Assets.speaker.provider(),
        ),
        const ScalerGap(12),
        Text(
          'blendthink / Tatsuya Okayama',
          style: theme.textTheme.labelLarge,
        ),
        const ScalerGap(36),
      ],
    );
  }
}
