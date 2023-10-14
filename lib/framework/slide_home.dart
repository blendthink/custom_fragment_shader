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
          child: _SlideFrame(
            child: _child,
          ),
        ),
      ),
    );
  }
}

final class _SlideFrame extends StatelessWidget {
  const _SlideFrame({
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Align(
      alignment: Alignment.topCenter,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final frameHeight = constraints.maxHeight;
            final frameScale = frameHeight / 1080;
            return MediaQuery(
              data: data.copyWith(
                textScaleFactor: frameScale,
              ),
              child: Stack(
                children: [
                  const _SlideBackground(),
                  _child,
                  _SlideFooter(
                    frameHeight: frameHeight,
                  ),
                ],
              ),
            );
          },
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

final class _SlideFooter extends StatelessWidget {
  const _SlideFooter({
    required double frameHeight,
  }) : _frameHeight = frameHeight;

  final double _frameHeight;

  @override
  Widget build(BuildContext context) {
    final height = _frameHeight / 12;
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
  }
}
