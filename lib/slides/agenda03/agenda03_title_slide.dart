import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/templates/title_center_slide.dart';
import 'package:flutter/material.dart';

final class Agenda03TitleSlide extends SlideStatelessWidget {
  const Agenda03TitleSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitleCenterSlide(Agenda.agenda03);
  }

  @override
  String get speakerNote => '''
ここまで Flutter での Fragment Shader の実装方法についてお話しました。

しかし、実装進める中でいくつか疑問点が出てきたのではないでしょうか。
それらの疑問点を解消すべく、Fragment Shader が実行されるまでの仕組みをさらにみていきましょう。''';
}
