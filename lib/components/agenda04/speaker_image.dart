import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/gen/assets.gen.dart';
import 'package:flutter/material.dart';

final class SpeakerImage extends StatelessWidget {
  const SpeakerImage({super.key});

  @override
  Widget build(BuildContext context) {
    final imageHeight = 200 * context.frameScale;
    return Assets.speaker.image(
      height: imageHeight,
      fit: BoxFit.fitHeight,
    );
  }
}
