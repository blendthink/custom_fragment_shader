import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/templates/title_center_slide.dart';
import 'package:flutter/material.dart';

final class Agenda02TitleSlide extends SlideStatelessWidget {
  const Agenda02TitleSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitleCenterSlide(Agenda.agenda02);
  }
}
