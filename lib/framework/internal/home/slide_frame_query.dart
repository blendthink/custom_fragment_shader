import 'package:flutter/material.dart';

enum SlideFrameQueryAspect {
  frameScale,
}

final class SlideFrameQuery extends InheritedModel<SlideFrameQueryAspect> {
  const SlideFrameQuery({
    required this.frameScale,
    required super.child,
    super.key,
  });

  final double frameScale;

  @override
  bool updateShouldNotify(SlideFrameQuery oldWidget) {
    return frameScale != oldWidget.frameScale;
  }

  @override
  bool updateShouldNotifyDependent(
    SlideFrameQuery oldWidget,
    Set<SlideFrameQueryAspect> dependencies,
  ) {
    for (final dependency in dependencies) {
      switch (dependency) {
        case SlideFrameQueryAspect.frameScale:
          if (frameScale != oldWidget.frameScale) {
            return true;
          }
      }
    }
    return false;
  }

  static SlideFrameQuery _of(
    BuildContext context, [
    SlideFrameQueryAspect? aspect,
  ]) {
    return InheritedModel.inheritFrom<SlideFrameQuery>(
      context,
      aspect: aspect,
    )!;
  }

  static double _frameScaleOf(BuildContext context) {
    return _of(context, SlideFrameQueryAspect.frameScale).frameScale;
  }
}

extension SlideFrameQueryX on BuildContext {
  double get frameScale => SlideFrameQuery._frameScaleOf(this);
}
