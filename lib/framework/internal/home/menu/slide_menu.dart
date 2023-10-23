import 'package:custom_fragment_shader/framework/internal/home/slide_background.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/internal/slide_framework.dart';
import 'package:custom_fragment_shader/framework/internal/slide_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
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
        return _SlidePreview(
          index: slideIndex,
          slide: slide,
          onTap: () => context.framework.goToSlide(slideIndex),
        );
      },
      separatorBuilder: (context, index) {
        return gap;
      },
    );
  }
}

final class _SlidePreview extends StatelessWidget {
  const _SlidePreview({
    required this.index,
    required this.slide,
    required this.onTap,
  });

  final int index;
  final SlideStatelessWidget slide;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelMedium;
    final isSelected = index == context.slideNumber;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$index',
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
          child: _SlidePreviewFrame(
            slide: slide,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}

final class _SlidePreviewFrame extends StatelessWidget {
  const _SlidePreviewFrame({
    required SlideStatelessWidget slide,
    required VoidCallback onTap,
  })  : _slide = slide,
        _onTap = onTap;

  final SlideStatelessWidget _slide;
  final VoidCallback _onTap;

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
                  onTap: _onTap,
                  child: _slide,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
