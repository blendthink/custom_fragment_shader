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
import 'package:custom_fragment_shader/slides/agenda02/agenda02_run01_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_run02_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_run03_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_implementation_flow_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_implementation_flow_step1_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_implementation_flow_step2_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_implementation_flow_step3_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_load01_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_load02_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_load03_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_load04_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_official_site_slide.dart';
import 'package:custom_fragment_shader/slides/agenda02/agenda02_title_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_compile01_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_compile02_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_compile03_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_compile04_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_compile05_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_compile06_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_compile07_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_compile08_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_compile09_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_compile10_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_compile11_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_load01_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_load02_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_load03_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_load04_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_load05_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_load06_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_load07_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_run01_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_run02_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_run03_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_run04_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_run05_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_run06_slide.dart';
import 'package:custom_fragment_shader/slides/agenda03/agenda03_title_slide.dart';
import 'package:custom_fragment_shader/slides/agenda04/agenda04_hologram_effect01_slide.dart';
import 'package:custom_fragment_shader/slides/agenda04/agenda04_ink_sparkle01_slide.dart';
import 'package:custom_fragment_shader/slides/agenda04/agenda04_pixelation01_slide.dart';
import 'package:custom_fragment_shader/slides/agenda04/agenda04_title_slide.dart';
import 'package:custom_fragment_shader/slides/agenda04/agenda04_transition_animation01_slide.dart';
import 'package:custom_fragment_shader/slides/agenda_slide.dart';
import 'package:custom_fragment_shader/slides/intro_slide.dart';
import 'package:custom_fragment_shader/slides/outro_slide.dart';
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
      Agenda02Load02Slide(),
      Agenda02Load03Slide(),
      Agenda02Load04Slide(),
      Agenda02ImplementationFlowStep3Slide(),
      Agenda02Run01Slide(),
      Agenda02Run02Slide(),
      Agenda02Run03Slide(),
      Agenda03TitleSlide(),
      Agenda03Compile01Slide(),
      Agenda03Compile02Slide(),
      Agenda03Compile03Slide(),
      Agenda03Compile04Slide(),
      Agenda03Compile05Slide(),
      Agenda03Compile06Slide(),
      Agenda03Compile07Slide(),
      Agenda03Compile08Slide(),
      Agenda03Compile09Slide(),
      Agenda03Compile10Slide(),
      Agenda03Compile11Slide(),
      Agenda03Load01Slide(),
      Agenda03Load02Slide(),
      Agenda03Load03Slide(),
      Agenda03Load04Slide(),
      Agenda03Load05Slide(),
      Agenda03Load06Slide(),
      Agenda03Load07Slide(),
      Agenda03Run01Slide(),
      Agenda03Run02Slide(),
      Agenda03Run03Slide(),
      Agenda03Run04Slide(),
      Agenda03Run05Slide(),
      Agenda03Run06Slide(),
      Agenda04TitleSlide(),
      Agenda04Pixelation01Slide(),
      Agenda04InkSparkle01Slide(),
      Agenda04HologramEffect01Slide(),
      Agenda04TransitionAnimation01Slide(),
      OutroSlide(),
    ];

    return SlideApp(
      theme: appTheme,
      slides: slides,
    );
  }
}
