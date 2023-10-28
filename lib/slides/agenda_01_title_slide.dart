import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/slides/data/agenda.dart';
import 'package:custom_fragment_shader/slides/templates/title_center_slide.dart';
import 'package:flutter/material.dart';

final class Agenda01TitleSlide extends SlideStatelessWidget {
  const Agenda01TitleSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitleCenterSlide(Agenda.agenda01);
  }

  @override
  String get speakerNote => '''
それでは、はじめに Fragment Shader とは何なのかについて見ていきます。''';
}
