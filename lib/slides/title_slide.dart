import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/components/title/title_backgroud.dart';
import 'package:custom_fragment_shader/components/title/title_body.dart';
import 'package:flutter/material.dart';

final class TitleSlide extends SlideStatelessWidget {
  const TitleSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        TitleBackground(),
        TitleBody(),
      ],
    );
  }

  @override
  String get speakerNote => 'それでは発表をはじめさせていただきます。';
}
