import 'package:custom_fragment_shader/components/agenda02/implementation_flow_header.dart';
import 'package:custom_fragment_shader/components/agenda02/implementation_flow_title.dart';
import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';

final class Agenda02ImplementationFlowStep2Slide extends SlideStatelessWidget {
  const Agenda02ImplementationFlowStep2Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const body = Row(
      children: [
        ScalerGap(36),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScalerGap(12),
            ImplementationFlowHeader(),
            ImplementationFlowTitle(
              index: 1,
              title: 'プログラムファイルを作成',
            ),
            ImplementationFlowTitle(
              index: 2,
              title: 'プログラムファイルを読み込む部分を実装',
              isHighlight: true,
            ),
            ImplementationFlowTitle(
              index: 3,
              title: 'プログラムファイルを実行する部分を実装',
            ),
            ScalerGap(72),
          ],
        ),
      ],
    );

    return const TitleHeaderSlide(
      title: Agenda.agenda02,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
次に、作成した Fragment Shader 用のプログラムファイルを、アプリ側で読み込む部分を実装していきます。''';
}
