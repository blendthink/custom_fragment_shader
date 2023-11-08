import 'package:custom_fragment_shader/components/ticker_builder.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

final class InkSparkleFrame extends StatelessWidget {
  const InkSparkleFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return TickingBuilder(
      builder: (context, time) {
        return ShaderBuilder(
          assetKey: 'shaders/ink_sparkle.frag',
          (context, shader, child) => AnimatedSampler(
            (image, size, canvas) {
              shader.setFloatUniforms((uniforms) {
                uniforms
                  ..setSize(size)
                  ..setFloat(time);
              });
              canvas.drawRect(
                Offset.zero & size,
                Paint()..shader = shader,
              );
            },
            child: SizedBox.square(
              dimension: 200 * context.frameScale,
              child: const ColoredBox(
                color: Colors.transparent,
              ),
            ),
          ),
        );
      },
    );
  }
}
