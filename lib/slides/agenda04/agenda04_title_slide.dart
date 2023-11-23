import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/templates/title_center_slide.dart';
import 'package:flutter/material.dart';

final class Agenda04TitleSlide extends SlideStatelessWidget {
  const Agenda04TitleSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitleCenterSlide(Agenda.agenda04);
  }

  @override
  String get speakerNote => '''
ここまで、Fragment Shader とは何か、実装方法はどうするのか、その仕組みはどうなっているのかなどの基本的・根本的な部分を見ていきました。

ただこれだけでは、いまいち、実際の開発でどのように役立つのかよく分かりません。
ですので、最後に、実際の開発でどのように役立つのか、いくつかの実装例を紹介していきます。''';
}
