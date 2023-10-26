import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/slides/components/intro/speacker_intro.dart';
import 'package:custom_fragment_shader/slides/components/intro/speaker_avatar.dart';
import 'package:flutter/material.dart';

final class IntroSlide extends SlideStatelessWidget {
  const IntroSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpeakerAvatar(),
        ScalerGap(36),
        SpeakerIntro(),
      ],
    );
  }
}
