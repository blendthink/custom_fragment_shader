import 'package:custom_fragment_shader/components/reference.dart';
import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda03Run06Slide extends SlideStatelessWidget {
  const Agenda03Run06Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
// ...
void Canvas::drawRect(double left,
                      double top,
                      double right,
                      double bottom,
                      Dart_Handle paint_objects,
                      Dart_Handle paint_data) {
  Paint paint(paint_objects, paint_data);
  // ...
  if (display_list_builder_) {
    DlPaint dl_paint;
    paint.paint(dl_paint, kDrawRectFlags);
    builder()->DrawRect(SkRect::MakeLTRB(SafeNarrow(left), SafeNarrow(top),
                                         SafeNarrow(right), SafeNarrow(bottom)),
                        dl_paint);
  }
}
// ...''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/ui/painting/canvas.cc',
      language: Language.cpp,
      theme: androidStudioTheme,
    );

    final body = Column(
      children: [
        Expanded(
          child: SizedBox(
            height: double.infinity,
            child: codeBlock,
          ),
        ),
        const ScalerGap(16),
        const Reference(
          'https://github.com/flutter/engine/blob/555ffa17b55c38b7fa4c203c66ec673c3785d380/lib/ui/painting/canvas.cc#L256',
        ),
      ],
    );

    return TitleHeaderSlide(
      title: Agenda.agenda03,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
`Builder` の `DrawRect()` メソッドに渡して描画を行っています。

この後は、描画エンジンの処理に移っていき、より複雑になりますので、時間の都合上省略します。
描画エンジンのソースコードは GitHub に公開されていますので、興味ある方はぜひ覗いてみていただければと思います。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
