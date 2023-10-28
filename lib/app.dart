import 'package:custom_fragment_shader/framework/slide_app.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/slides/agenda01_title_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02_title_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03_title_slide.dart';
import 'package:custom_fragment_shader/slides/agenda04_title_slide.dart';
import 'package:custom_fragment_shader/slides/agenda_slide.dart';
import 'package:custom_fragment_shader/slides/intro_slide.dart';
import 'package:custom_fragment_shader/slides/outro_slide.dart';
import 'package:custom_fragment_shader/slides/sample_slide.dart';
import 'package:custom_fragment_shader/slides/title_slide.dart';
import 'package:custom_fragment_shader/theme.dart';
import 'package:flutter/material.dart';

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const slides = <SlideStatelessWidget>[
      TitleSlide(),
      IntroSlide(),
      AgendaSlide(),
      Agenda01TitleSlide(),
      Agenda02TitleSlide(),
      Agenda03TitleSlide(),
      Agenda04TitleSlide(),
      OutroSlide(),
    ];

    final customSlides = [...slides];
    customSlides.addAll(
      Iterable<SlideStatelessWidget>.generate(
        10,
        (index) => SampleSlide(index),
      ),
    );
    return SlideApp(
      theme: appTheme,
      slides: customSlides,
    );
  }
}
