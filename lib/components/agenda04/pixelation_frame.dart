import 'package:custom_fragment_shader/components/agenda04/scalable_speaker_image.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

final class PixelationFrame extends StatelessWidget {
  const PixelationFrame({super.key});

  @override
  Widget build(BuildContext context) {
    final frameSize = 200 * context.frameScale;
    const pixelCount = 20.0;

    return SizedBox.square(
      dimension: frameSize,
      child: ShaderBuilder(
        assetKey: 'shaders/pixelation.frag',
        (context, shader, child) => AnimatedSampler(
          (image, size, canvas) {
            shader.setFloatUniforms((uniforms) {
              uniforms
                ..setSize(size)
                ..setFloat(pixelCount);
            });
            shader.setImageSampler(0, image);
            canvas.drawRect(
              Offset.zero & size,
              Paint()..shader = shader,
            );
          },
          child: const ScalableSpeakerImage(),
        ),
      ),
    );
  }
}
