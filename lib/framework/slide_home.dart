import 'package:custom_fragment_shader/framework/slide_framework.dart';
import 'package:custom_fragment_shader/framework/slide_number_listener.dart';
import 'package:custom_fragment_shader/framework/slide_intents.dart';
import 'package:flutter/material.dart';

final class SlideHome extends StatelessWidget {
  const SlideHome({
    required Widget child,
    super.key,
  }) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Focus(
        autofocus: true,
        child: Actions(
          actions: <Type, Action<Intent>>{
            BackIntent: CallbackAction<BackIntent>(
              onInvoke: (_) => context.framework.previous(),
            ),
            NextIntent: CallbackAction<NextIntent>(
              onInvoke: (_) => context.framework.next(),
            ),
            MenuIntent: CallbackAction<MenuIntent>(
              onInvoke: (_) => context.framework.menu(),
            ),
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  const _SlideBackground(),
                  _SlideBody(child: _child),
                  const _SlideFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class _SlideBackground extends StatelessWidget {
  const _SlideBackground();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF602678),
              Color(0xFF1D192B),
            ],
          ),
        ),
      ),
    );
  }
}

final class _SlideBody extends StatelessWidget {
  const _SlideBody({
    required Widget child,
  }) : _navigator = child;

  final Widget _navigator;

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final scale = constraints.maxHeight / 1080;
        return MediaQuery(
          data: data.copyWith(
            textScaleFactor: scale,
          ),
          child: _navigator,
        );
      },
    );
  }
}

final class _SlideFooter extends StatelessWidget {
  const _SlideFooter();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight / 5;
        return Align(
          alignment: Alignment.bottomCenter,
          child: SlideNumberBuilder(
            builder: (context, slideNumber) {
              return SizedBox(
                height: height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('FlutterKaigi 2023'),
                    Text('$slideNumber'),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
