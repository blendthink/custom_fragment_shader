import 'package:custom_fragment_shader/framework/slide_framework.dart';
import 'package:custom_fragment_shader/framework/slide_home.dart';
import 'package:custom_fragment_shader/framework/slide_router.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/framework/slide_intents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class SlideApp extends StatelessWidget {
  const SlideApp({
    required ThemeData theme,
    required List<SlideStatelessWidget> slides,
    super.key,
  })  : _theme = theme,
        _slides = slides;

  final ThemeData _theme;
  final List<SlideStatelessWidget> _slides;

  @override
  Widget build(BuildContext context) {
    final router = SlideRouter(slides: _slides);
    final routerConfig = router.buildConfig();

    return MaterialApp.router(
      theme: _theme,
      shortcuts: _shortcuts,
      routerConfig: routerConfig,
      builder: (_, child) => SlideFramework(
        router: router,
        child: SlideHome(child: child!),
      ),
    );
  }
}

const _shortcuts = <ShortcutActivator, Intent>{
  SingleActivator(LogicalKeyboardKey.arrowLeft): BackIntent(),
  SingleActivator(LogicalKeyboardKey.arrowRight): NextIntent(),
  SingleActivator(LogicalKeyboardKey.period): MenuIntent(),
};
