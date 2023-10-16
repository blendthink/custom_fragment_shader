import 'package:custom_fragment_shader/framework/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_framework.dart';
import 'package:custom_fragment_shader/framework/slide_intents.dart';
import 'package:custom_fragment_shader/framework/slide_query.dart';
import 'package:custom_fragment_shader/gen/assets.gen.dart';
import 'package:flutter/foundation.dart';
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
            final frameScale = frameHeight / 360;
            return SlideFrameQuery(
              frameScale: frameScale,
              child: MediaQuery(
                data: data.copyWith(
                  textScaleFactor: frameScale,
                ),
                child: Stack(
                  children: [
                    const _SlideBackground(),
                    _child,
                    const _SlideFooter(),
                    const _SlideTapArea()
                  ],
                ),
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
  const _SlideFooter();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelSmall;

    final frameScale = context.frameScale;
    final iconSize = 24 * frameScale;
    final paddingBetweenIconAndText = 4 * frameScale;
    final flutterKaigiLogo = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.flutterkaigiLogo.svg(
          width: iconSize,
          height: iconSize,
        ),
        SizedBox(
          width: paddingBetweenIconAndText,
        ),
        Text(
          'FlutterKaigi 2023',
          style: textStyle?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );

    final framePadding = 12 * frameScale;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.all(framePadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            flutterKaigiLogo,
            Visibility(
              visible: context.shouldShowSlideNumber,
              child: Text(
                '${context.slideNumber}',
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _SlideTapArea extends StatelessWidget {
  const _SlideTapArea();

  @override
  Widget build(BuildContext context) {
    final Color hoverColor;
    if (kIsWeb) {
      hoverColor = Theme.of(context).hoverColor;
    } else {
      hoverColor = Colors.transparent;
    }

    return Row(
      children: [
        Expanded(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              hoverColor: hoverColor,
              onTap: context.framework.previous,
              onLongPress: context.framework.menu,
            ),
          ),
        ),
        Expanded(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              hoverColor: hoverColor,
              onTap: context.framework.next,
              onLongPress: context.framework.menu,
            ),
          ),
        ),
      ],
    );
  }
}
