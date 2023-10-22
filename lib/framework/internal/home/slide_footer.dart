import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/internal/slide_query.dart';
import 'package:custom_fragment_shader/gen/assets.gen.dart';
import 'package:flutter/material.dart';

final class SlideFooter extends StatelessWidget {
  const SlideFooter({super.key});

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
