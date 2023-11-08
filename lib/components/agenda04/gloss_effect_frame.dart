import 'package:custom_fragment_shader/components/agenda04/speaker_image.dart';
import 'package:custom_fragment_shader/components/ticker_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

final class GlossEffectFrame extends StatelessWidget {
  const GlossEffectFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return TickingBuilder(
      builder: (context, time) {
        return ShaderBuilder(
          assetKey: 'shaders/gloss_effect.frag',
          (context, shader, child) => AnimatedSampler(
            (image, size, canvas) {
              shader.setFloatUniforms((uniforms) {
                uniforms
                  ..setSize(size)
                  ..setFloat(time);
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
      },
    );
  }
}
