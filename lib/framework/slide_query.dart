import 'package:flutter/material.dart';

enum SlideQueryAspect {
  slideNumber,
}

final class SlideQuery extends InheritedModel<SlideQueryAspect> {
  const SlideQuery({
    required this.slideNumber,
    required super.child,
    super.key,
  });

  final int slideNumber;

  @override
  bool updateShouldNotify(SlideQuery oldWidget) {
    return slideNumber != oldWidget.slideNumber;
  }

  @override
  bool updateShouldNotifyDependent(
    SlideQuery oldWidget,
    Set<SlideQueryAspect> dependencies,
  ) {
    for (final dependency in dependencies) {
      switch (dependency) {
        case SlideQueryAspect.slideNumber:
          if (slideNumber != oldWidget.slideNumber) {
            return true;
          }
      }
    }
    return false;
  }

  static SlideQuery _of(BuildContext context, [SlideQueryAspect? aspect]) {
    return InheritedModel.inheritFrom<SlideQuery>(context, aspect: aspect)!;
  }

  static int _slideNumberOf(BuildContext context) {
    return _of(context, SlideQueryAspect.slideNumber).slideNumber;
  }
}

extension SlideQueryX on BuildContext {
  int get slideNumber => SlideQuery._slideNumberOf(this);
}
