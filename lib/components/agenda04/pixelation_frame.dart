import 'package:custom_fragment_shader/components/agenda04/speaker_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

const _pixelCount = 20.0;

final class PixelationFrame extends StatelessWidget {
  const PixelationFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: 'shaders/pixelation.frag',
      (context, shader, child) => AnimatedSampler(
        (image, size, canvas) {
          shader.setFloatUniforms((uniforms) {
            uniforms
              ..setSize(size)
              ..setFloat(_pixelCount);
          });
          shader.setImageSampler(0, image);
          canvas.drawRect(
            Offset.zero & size,
            Paint()..shader = shader,
          );
        },
        child: const SpeakerImage(),
      ),
    );
  }
}
