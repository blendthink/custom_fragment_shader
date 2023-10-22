import 'package:custom_fragment_shader/framework/internal/home/slide_background.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_footer.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_tap_area.dart';
import 'package:flutter/material.dart';

final class SlideFrame extends StatelessWidget {
  const SlideFrame({
    required Widget child,
    super.key,
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
                    const SlideBackground(),
                    _child,
                    const SlideFooter(),
                    const SlideTapArea()
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
