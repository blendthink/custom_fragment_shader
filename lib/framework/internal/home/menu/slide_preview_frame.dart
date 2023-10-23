import 'package:custom_fragment_shader/framework/internal/home/menu/slide_preview_query.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_background.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/internal/slide_framework.dart';
import 'package:flutter/material.dart';

final class SlidePreviewFrame extends StatelessWidget {
  const SlidePreviewFrame({super.key});

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return SizedBox(
      height: context.previewHeight,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: MediaQuery(
          data: data.copyWith(
            textScaleFactor: context.previewScale,
          ),
          child: Stack(
            children: [
              const SlideBackground(),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => context.framework.goToSlide(context.slideIndex),
                  child: SlideFrameQuery(
                    frameHeight: context.previewHeight,
                    child: context.slide,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
