import 'package:flutter/material.dart';

enum SlideQueryAspect {
  slideNumber,
}

final class SlideQuery extends InheritedModel<SlideQueryAspect> {
  const SlideQuery({
    required int slideNumber,
    required super.child,
    super.key,
  }) : _slideNumber = slideNumber;

  final int _slideNumber;

  @override
  bool updateShouldNotify(SlideQuery oldWidget) {
    return _slideNumber != oldWidget._slideNumber;
  }

  @override
  bool updateShouldNotifyDependent(
    SlideQuery oldWidget,
    Set<SlideQueryAspect> dependencies,
  ) {
    for (final dependency in dependencies) {
      switch (dependency) {
        case SlideQueryAspect.slideNumber:
          if (_slideNumber != oldWidget._slideNumber) {
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
    return _of(context, SlideQueryAspect.slideNumber)._slideNumber;
  }
}

extension SlideQueryX on BuildContext {
  int get slideNumber => SlideQuery._slideNumberOf(this);

  bool get shouldShowSlideNumber => slideNumber > 0;
}
