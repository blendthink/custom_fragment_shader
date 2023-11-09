import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:go_router/go_router.dart';

abstract interface class SlideWidget implements Widget {
  GoRouterPageBuilder get pageBuilder;

  String get speakerNote;
}

abstract base class SlideStatelessWidget extends StatelessWidget
    implements SlideWidget {
  const SlideStatelessWidget({super.key});

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );

  @override
  String get speakerNote => '';
}

const _transitionDuration = Duration(seconds: 1);

class DotsCurtainTransitionPage<T> extends CustomTransitionPage<T> {
  const DotsCurtainTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(
          transitionsBuilder: _transitionsBuilder,
          transitionDuration: _transitionDuration,
          reverseTransitionDuration: _transitionDuration,
        );
}

Widget _transitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return ShaderBuilder(
    assetKey: 'shaders/transition.frag',
    (context, shader, _) {
      return AnimatedSampler(
        (image, size, canvas) {
          shader.setFloatUniforms((uniforms) {
            uniforms
              ..setSize(size)
              ..setFloat(animation.value);
          });
          shader.setImageSampler(0, image);
          canvas.drawRect(
            Offset.zero & size,
            Paint()..shader = shader,
          );
        },
        child: child,
      );
    },
  );
}
