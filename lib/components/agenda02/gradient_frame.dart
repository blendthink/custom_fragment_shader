import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

final class GradientFrame extends StatelessWidget {
  const GradientFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ShaderBuilder(
        assetKey: 'shaders/gradient.frag',
        (context, shader, child) => CustomPaint(
          size: Size(
            constraints.maxWidth,
            constraints.maxHeight,
          ),
          painter: _GradientShaderPainter(shader),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _GradientShaderPainter extends CustomPainter {
  const _GradientShaderPainter(this.shader);

  final FragmentShader shader;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(covariant _GradientShaderPainter oldDelegate) {
    return oldDelegate.shader != shader;
  }
}
