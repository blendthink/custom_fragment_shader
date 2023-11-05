import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

final class OrangeFrame extends StatelessWidget {
  const OrangeFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: 'shaders/orange.frag',
      (context, shader, child) => AnimatedSampler(
        (image, size, canvas) {
          canvas.drawRect(
            Offset.zero & size,
            Paint()..shader = shader,
          );
        },
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
