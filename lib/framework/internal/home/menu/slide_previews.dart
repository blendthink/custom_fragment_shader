import 'package:custom_fragment_shader/framework/internal/home/menu/slide_preview.dart';
import 'package:custom_fragment_shader/framework/internal/home/menu/slide_preview_query.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/internal/slide_framework.dart';
import 'package:flutter/material.dart';

final class SlidePreviews extends StatelessWidget {
  const SlidePreviews({super.key});

  @override
  Widget build(BuildContext context) {
    final slides = context.framework.slides;
    final gap = SizedBox(width: 12 * context.frameScale);
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: slides.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return gap;
        }
        if (index == slides.length + 1) {
          return gap;
        }
        final slideIndex = index - 1;
        final slide = slides[slideIndex];
        return SlidePreviewQuery(
          slideIndex: slideIndex,
          slide: slide,
          child: const SlidePreview(),
        );
      },
      separatorBuilder: (context, index) {
        return gap;
      },
    );
  }
}
