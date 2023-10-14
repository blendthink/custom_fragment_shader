import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:flutter/material.dart';

final class OutroSlide extends SlideStatelessWidget {
  const OutroSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Outro Slide',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
