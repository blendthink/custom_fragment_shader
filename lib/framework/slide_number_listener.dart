import 'package:custom_fragment_shader/framework/slide_framework.dart';
import 'package:custom_fragment_shader/framework/slide_router.dart';
import 'package:flutter/material.dart';

typedef SlideNumberWidgetBuilder = Widget Function(
  BuildContext context,
  int slideNumber,
);

final class SlideNumberBuilder extends StatefulWidget {
  const SlideNumberBuilder({
    required this.builder,
    super.key,
  });

  final SlideNumberWidgetBuilder builder;

  @override
  State<SlideNumberBuilder> createState() => _SlideNumberWidgetListenerState();
}

final class _SlideNumberWidgetListenerState extends State<SlideNumberBuilder> {
  SlideRouter? _router;
  int? _slideNumber;

  @override
  void dispose() {
    _router?.removeListener(_onRouteChange);

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_router != null) return;

    final framework = context.framework;

    _slideNumber = framework.slideNumber;
    _router = framework.router..addListener(_onRouteChange);

    _onRouteChange();
  }

  void _onRouteChange() {
    final framework = context.framework;

    if (_slideNumber == framework.slideNumber) return;

    setState(() => _slideNumber = framework.slideNumber);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _slideNumber ?? 1);
  }
}
