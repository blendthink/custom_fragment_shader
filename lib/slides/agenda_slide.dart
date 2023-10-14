import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:flutter/material.dart';

final class AgendaSlide extends SlideStatelessWidget {
  const AgendaSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Agenda Slide',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
