import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/gen/assets.gen.dart';
import 'package:flutter/material.dart';

final class ScalableSpeakerImage extends StatelessWidget {
  const ScalableSpeakerImage({super.key});

  @override
  Widget build(BuildContext context) {
    final imageSize = 200 * context.frameScale;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: imageSize,
        minWidth: imageSize,
        maxWidth: imageSize,
        maxHeight: imageSize,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.speaker.image().image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
