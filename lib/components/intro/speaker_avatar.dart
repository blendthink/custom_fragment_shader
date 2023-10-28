import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/gen/assets.gen.dart';
import 'package:flutter/material.dart';

final class SpeakerAvatar extends StatelessWidget {
  const SpeakerAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100 * context.frameScale,
      backgroundImage: Assets.speaker.provider(),
    );
  }
}
