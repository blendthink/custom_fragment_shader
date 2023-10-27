import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/slides/data/agenda.dart';
import 'package:custom_fragment_shader/slides/templates/title_center_slide.dart';
import 'package:flutter/material.dart';

final class Agenda03TitleSlide extends SlideStatelessWidget {
  const Agenda03TitleSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitleCenterSlide(Agenda.agenda03);
  }
}
