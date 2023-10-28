import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/components/title/presentation_title.dart';
import 'package:custom_fragment_shader/components/title/speaker_label.dart';
import 'package:flutter/material.dart';

final class TitleBody extends StatelessWidget {
  const TitleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PresentationTitle(),
          ScalerGap(84),
          SpeakerLabel(),
          ScalerGap(40),
        ],
      ),
    );
  }
}
