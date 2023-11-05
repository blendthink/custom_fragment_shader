import 'package:custom_fragment_shader/framework/slide_app.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/slides/agenda01/agenda01_diff_between_cpu_and_gpu_slide.dart';
import 'package:custom_fragment_shader/slides/agenda01/agenda01_pipeline_highlight_slide.dart';
import 'package:custom_fragment_shader/slides/agenda01/agenda01_pipeline_slide.dart';
import 'package:custom_fragment_shader/slides/agenda01/agenda01_title_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_frag01_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_frag02_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_frag03_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_frag04_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_frag05_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_frag06_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_frag07_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_frag08_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_frag09_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_frag10_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_frag11_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_glsl_animation_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_glsl_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_implementation_flow_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_implementation_flow_step1_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_implementation_flow_step2_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_implementation_flow_step3_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_load01_slide.dart';
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
    const slides = <SlideWidget>[
      TitleSlide(),
      IntroSlide(),
      AgendaSlide(),
      Agenda01TitleSlide(),
      Agenda01PipelineSlide(),
      Agenda01PipelineHighlightSlide(),
      Agenda01DiffBetweenCpuAndGpuSlide(),
      Agenda02TitleSlide(),
      Agenda02OfficialSiteSlide(),
      Agenda02ImplementationFlowSlide(),
      Agenda02ImplementationFlowStep1Slide(),
      Agenda02GlslSlide(),
      Agenda02GlslAnimationSlide(),
      Agenda02Frag01Slide(),
      Agenda02Frag02Slide(),
      Agenda02Frag03Slide(),
      Agenda02Frag04Slide(),
      Agenda02Frag05Slide(),
      Agenda02Frag06Slide(),
      Agenda02Frag07Slide(),
      Agenda02Frag08Slide(),
      Agenda02Frag09Slide(),
      Agenda02Frag10Slide(),
      Agenda02Frag11Slide(),
      Agenda02ImplementationFlowStep2Slide(),
      Agenda02Load01Slide(),
      Agenda02ImplementationFlowStep3Slide(),
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
