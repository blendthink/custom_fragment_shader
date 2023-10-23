import 'package:custom_fragment_shader/framework/internal/home/menu/slide_preview_frame.dart';
import 'package:custom_fragment_shader/framework/internal/home/menu/slide_preview_query.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/internal/slide_query.dart';
import 'package:flutter/material.dart';

final class SlidePreview extends StatelessWidget {
  const SlidePreview({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelMedium;
    final slideIndex = context.slideIndex;
    final isSelected = slideIndex == context.slideNumber;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$slideIndex',
          style: textStyle,
        ),
        SizedBox(height: 8 * context.frameScale),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.white : Colors.transparent,
              width: 2 * context.frameScale,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          child: const SlidePreviewFrame(),
        ),
      ],
    );
  }
}
