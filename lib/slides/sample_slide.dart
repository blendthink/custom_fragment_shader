import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:flutter/material.dart';

final class SampleSlide extends SlideStatelessWidget {
  const SampleSlide(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sample Slide: $index',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
