import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_arrows/widget_arrows.dart';

final class Agenda02Frag10Slide extends SlideStatelessWidget {
  const Agenda02Frag10Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
#version 460 core

#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

// 0xFFFFA500
const vec4 orangeColor = vec4(1.0, 0.65, 0.0, 1.0);''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'shaders/orange.frag',
      language: Language.glsl,
      theme: androidStudioTheme,
    );

    final body = Row(
      children: [
        Expanded(
          child: SizedBox(
            height: double.infinity,
            child: codeBlock,
          ),
        ),
        const Expanded(
          child: SizedBox(
            height: double.infinity,
            child: _Color(),
          ),
        ),
      ],
    );

    return TitleHeaderSlide(
      title: Agenda.agenda02,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
では、どのようにすればいいかというと、16 進数の値を 10 進数に変換した後 255 で割ります。

例えば、A5 は 10 進数に変換すると 16 ^ 1 * 10 + 16 ^ 0 * 5 ですので 165 となります。
これを 255 で割るので、約 0.65 となります。
順序に気をつけつつ、全ての値を変換してあげるとご覧のようになります。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
    key: state.pageKey,
    restorationId: state.pageKey.value,
    child: this,
  );
}

const _arrowIdColorCodeAlpha = 'color-code-alpha';
const _arrowIdColorCodeRed = 'color-code-red';
const _arrowIdColorCodeGreen = 'color-code-green';
const _arrowIdColorCodeBlue = 'color-code-blue';
const _arrowIdColorNameAlpha = 'color-name-alpha';
const _arrowIdColorNameRed = 'color-name-red';
const _arrowIdColorNameGreen = 'color-name-green';
const _arrowIdColorNameBlue = 'color-name-blue';
const _arrowIdGlslColorRed = 'glsl-color-red';
const _arrowIdGlslColorGreen = 'glsl-color-green';
const _arrowIdGlslColorBlue = 'glsl-color-blue';
const _arrowIdGlslColorAlpha = 'glsl-color-alpha';

final class _Color extends StatelessWidget {
  const _Color();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.titleLarge;

    final itemPadding = EdgeInsets.symmetric(
      vertical: 4 * context.frameScale,
    );

    final arrowWidth = 2 * context.frameScale;

    final colorCode = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '0x',
              style: textStyle,
            ),
            Padding(
              padding: itemPadding,
              child: const _ColorBox(
                color: Colors.transparent,
              ),
            ),
          ],
        ),
        const ScalerGap(16),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'FF',
              style: textStyle,
            ),
            ArrowElement(
              id: _arrowIdColorCodeAlpha,
              targetId: _arrowIdColorNameAlpha,
              targetAnchor: Alignment.topCenter,
              sourceAnchor: Alignment.bottomCenter,
              color: const Color(0x88FFFFFF),
              width: arrowWidth,
              bow: 0,
              child: Padding(
                padding: itemPadding,
                child: const _ColorBox(
                  color: Color(0x88FFFFFF),
                ),
              ),
            ),
          ],
        ),
        const ScalerGap(16),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'FF',
              style: textStyle,
            ),
            ArrowElement(
              id: _arrowIdColorCodeRed,
              targetId: _arrowIdColorNameRed,
              targetAnchor: Alignment.topCenter,
              sourceAnchor: Alignment.bottomCenter,
              color: Colors.red,
              width: arrowWidth,
              bow: 0,
              child: Padding(
                padding: itemPadding,
                child: const _ColorBox(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        const ScalerGap(16),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'A5',
              style: textStyle,
            ),
            ArrowElement(
              id: _arrowIdColorCodeGreen,
              targetId: _arrowIdColorNameGreen,
              targetAnchor: Alignment.topCenter,
              sourceAnchor: Alignment.bottomCenter,
              color: Colors.green,
              width: arrowWidth,
              child: Padding(
                padding: itemPadding,
                child: const _ColorBox(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
        const ScalerGap(16),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '00',
              style: textStyle,
            ),
            ArrowElement(
              id: _arrowIdColorCodeBlue,
              targetId: _arrowIdColorNameBlue,
              targetAnchor: Alignment.topCenter,
              sourceAnchor: Alignment.bottomCenter,
              color: Colors.blue,
              width: arrowWidth,
              child: Padding(
                padding: itemPadding,
                child: const _ColorBox(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ],
    );

    final colorNames = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ArrowElement(
          id: _arrowIdColorNameAlpha,
          targetId: _arrowIdGlslColorAlpha,
          targetAnchor: Alignment.topCenter,
          sourceAnchor: Alignment.bottomCenter,
          color: const Color(0x88FFFFFF),
          width: arrowWidth,
          child: Padding(
            padding: itemPadding,
            child: Text(
              'Alpha',
              style: textStyle,
            ),
          ),
        ),
        const ScalerGap(16),
        ArrowElement(
          id: _arrowIdColorNameRed,
          targetId: _arrowIdGlslColorRed,
          targetAnchor: Alignment.topCenter,
          sourceAnchor: Alignment.bottomCenter,
          color: Colors.red,
          width: arrowWidth,
          child: Padding(
            padding: itemPadding,
            child: Text(
              'Red',
              style: textStyle,
            ),
          ),
        ),
        const ScalerGap(16),
        ArrowElement(
          id: _arrowIdColorNameGreen,
          targetId: _arrowIdGlslColorGreen,
          targetAnchor: Alignment.topCenter,
          sourceAnchor: Alignment.bottomCenter,
          color: Colors.green,
          width: arrowWidth,
          child: Padding(
            padding: itemPadding,
            child: Text(
              'Green',
              style: textStyle,
            ),
          ),
        ),
        const ScalerGap(16),
        ArrowElement(
          id: _arrowIdColorNameBlue,
          targetId: _arrowIdGlslColorBlue,
          targetAnchor: Alignment.topCenter,
          sourceAnchor: Alignment.bottomCenter,
          color: Colors.blue,
          width: arrowWidth,
          child: Padding(
            padding: itemPadding,
            child: Text(
              'Blue',
              style: textStyle,
            ),
          ),
        ),
      ],
    );

    final glslColors = FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ScalerGap(16),
          Text('vec4(', style: textStyle),
          const ScalerGap(16),
          ArrowElement(
            id: _arrowIdGlslColorRed,
            child: Padding(
              padding: itemPadding,
              child: Text('255/255', style: textStyle),
            ),
          ),
          const ScalerGap(16),
          Text(',', style: textStyle),
          const ScalerGap(16),
          ArrowElement(
            id: _arrowIdGlslColorGreen,
            child: Padding(
              padding: itemPadding,
              child: Text('165/255', style: textStyle),
            ),
          ),
          const ScalerGap(16),
          Text(',', style: textStyle),
          const ScalerGap(16),
          ArrowElement(
            id: _arrowIdGlslColorBlue,
            child: Padding(
              padding: itemPadding,
              child: Text('0/255', style: textStyle),
            ),
          ),
          const ScalerGap(16),
          Text(',', style: textStyle),
          const ScalerGap(16),
          ArrowElement(
            id: _arrowIdGlslColorAlpha,
            child: Padding(
              padding: itemPadding,
              child: Text('255/255', style: textStyle),
            ),
          ),
          const ScalerGap(16),
          Text(');', style: textStyle),
          const ScalerGap(16),
        ],
      ),
    );

    return ArrowContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          colorCode,
          const ScalerGap(36),
          colorNames,
          const ScalerGap(36),
          glslColors,
        ],
      ),
    );
  }
}

final class _ColorBox extends StatelessWidget {
  const _ColorBox({
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    final colorBoxWidth = 24 * context.frameScale;
    final colorBoxHeight = 4 * context.frameScale;
    return ColoredBox(
      color: color,
      child: SizedBox(
        width: colorBoxWidth,
        height: colorBoxHeight,
      ),
    );
  }
}
