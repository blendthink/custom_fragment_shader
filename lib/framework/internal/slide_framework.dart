import 'package:custom_fragment_shader/framework/internal/slide_router.dart';
import 'package:flutter/material.dart';

final class SlideFramework extends InheritedWidget {
  const SlideFramework({
    required SlideRouter router,
    required super.child,
    super.key,
  }) : _router = router;

  final SlideRouter _router;

  void previous() => _router.previous();

  void next() => _router.next();

  void menu() {}

  @override
  bool updateShouldNotify(SlideFramework oldWidget) =>
      _router != oldWidget._router;

  static SlideFramework of(BuildContext context) {
    final framework =
        context.dependOnInheritedWidgetOfExactType<SlideFramework>();

    assert(framework != null, 'No SlideFramework found in context');

    return framework!;
  }
}

extension SlideFrameworkX on BuildContext {
  SlideFramework get framework => SlideFramework.of(this);
}
