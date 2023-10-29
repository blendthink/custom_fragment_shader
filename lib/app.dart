import 'package:custom_fragment_shader/framework/slide_app.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/slides/agenda01/agenda01_diff_between_cpu_and_gpu_slide.dart';
import 'package:custom_fragment_shader/slides/agenda01/agenda01_pipeline_highlight_slide.dart';
import 'package:custom_fragment_shader/slides/agenda01/agenda01_pipeline_slide.dart';
import 'package:custom_fragment_shader/slides/agenda01/agenda01_title_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_official_site_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_title_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_title_slide.dart';
import 'package:custom_fragment_shader/slides/agenda04/agenda04_title_slide.dart';
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
      Agenda01PipelineSlide(),
      Agenda01PipelineHighlightSlide(),
      Agenda01DiffBetweenCpuAndGpuSlide(),
      Agenda02TitleSlide(),
      Agenda02OfficialSiteSlide(),
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
