import 'package:custom_fragment_shader/framework/internal/home/menu/slide_preview_query.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_background.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/internal/slide_framework.dart';
import 'package:custom_fragment_shader/framework/internal/slide_query.dart';
import 'package:flutter/material.dart';

final class SlideMenu extends StatelessWidget {
  const SlideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final menuValueNotifier = context.framework.menuValueNotifier;
    return ValueListenableBuilder(
      valueListenable: menuValueNotifier,
      builder: (context, shouldShowMenu, _) {
        final menuHeight = context.menuHeight;
        return AnimatedPositioned(
          height: menuHeight,
          left: 0,
          right: 0,
          bottom: shouldShowMenu ? 0 : -menuHeight,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: const ColoredBox(
            color: Colors.black54,
            child: _SlidePreviews(),
          ),
        );
      },
    );
  }
}

final class MenuValueNotifier extends ValueNotifier<bool> {
  MenuValueNotifier() : super(false);

  void toggle() {
    value = !value;
  }
}

final class _SlidePreviews extends StatelessWidget {
  const _SlidePreviews();

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
          child: const _SlidePreview(),
        );
      },
      separatorBuilder: (context, index) {
        return gap;
      },
    );
  }
}

final class _SlidePreview extends StatelessWidget {
  const _SlidePreview();

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
          child: const _SlidePreviewFrame(),
        ),
      ],
    );
  }
}

final class _SlidePreviewFrame extends StatelessWidget {
  const _SlidePreviewFrame();

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
