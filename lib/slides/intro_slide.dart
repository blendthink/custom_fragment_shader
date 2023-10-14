import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:flutter/material.dart';

final class IntroSlide extends SlideStatelessWidget {
  const IntroSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Intro Slide',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
