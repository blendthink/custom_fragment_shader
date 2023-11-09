import 'package:custom_fragment_shader/framework/internal/home/menu/slide_menu.dart';
import 'package:custom_fragment_shader/framework/internal/slide_framework.dart';
import 'package:custom_fragment_shader/framework/internal/slide_query.dart';
import 'package:custom_fragment_shader/framework/internal/slide_router.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/framework/internal/slide_intents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class SlideApp extends StatefulWidget {
  const SlideApp({
    required ThemeData theme,
    required List<SlideWidget> slides,
    super.key,
  })  : _theme = theme,
        _slides = slides;

  final ThemeData _theme;
  final List<SlideWidget> _slides;

  @override
  State<SlideApp> createState() => _SlideAppState();
}

class _SlideAppState extends State<SlideApp> {
  late final _router = SlideRouter(slides: widget._slides);

  late MenuValueNotifier _menuValueNotifier;

  int _slideNumber = 0;

  void _onRouteChange() {
    setState(() => _slideNumber = _router.currentIndex);
  }

  @override
  void initState() {
    super.initState();
    _menuValueNotifier = MenuValueNotifier();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _router.addListener(_onRouteChange);

      // Required when navigating directly to a slide via a URL or deep link.
      _onRouteChange();
    });
  }

  @override
  void dispose() {
    _router.removeListener(_onRouteChange);
    _menuValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Custom Fragment Shader',
      theme: widget._theme,
      shortcuts: _shortcuts,
      routerConfig: _router.routerConfig,
      builder: (_, child) => SlideFramework(
        slides: widget._slides,
        router: _router,
        menuValueNotifier: _menuValueNotifier,
        child: SlideQuery(
          slideNumber: _slideNumber,
          child: child!,
        ),
      ),
    );
  }
}

const _shortcuts = <ShortcutActivator, Intent>{
  SingleActivator(LogicalKeyboardKey.arrowLeft): BackIntent(),
  SingleActivator(LogicalKeyboardKey.arrowRight): NextIntent(),
  SingleActivator(LogicalKeyboardKey.period): MenuIntent(),
  SingleActivator(LogicalKeyboardKey.keyL): LicenseIntent(),
  SingleActivator(LogicalKeyboardKey.keyP): PresentationIntent(),
};
