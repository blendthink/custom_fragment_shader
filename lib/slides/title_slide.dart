import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:flutter/material.dart';

final class TitleSlide extends SlideStatelessWidget {
  const TitleSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Custom Fragment Shader',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
