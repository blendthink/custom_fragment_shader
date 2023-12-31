import 'package:custom_fragment_shader/framework/internal/home/menu/slide_menu.dart';
import 'package:custom_fragment_shader/framework/internal/slide_router.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:flutter/material.dart';

final class SlideFramework extends InheritedWidget {
  const SlideFramework({
    required SlideRouter router,
    required this.slides,
    required this.menuValueNotifier,
    required super.child,
    super.key,
  }) : _router = router;

  final SlideRouter _router;

  final List<SlideWidget> slides;

  final MenuValueNotifier menuValueNotifier;

  void previous() => _router.previous();

  void next() => _router.next();

  void goToSlide(int index) {
    _router.goToSlide(index);
    menuValueNotifier.close();
  }

  void menu() => menuValueNotifier.toggle();

  @override
  bool updateShouldNotify(SlideFramework oldWidget) =>
      _router != oldWidget._router ||
      menuValueNotifier != oldWidget.menuValueNotifier;

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
