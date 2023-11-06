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

final class Agenda03Run03Slide extends SlideStatelessWidget {
  const Agenda03Run03Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
// ...
abstract class Canvas {
  // ...
  factory Canvas(PictureRecorder recorder, [ Rect? cullRect ]) = _NativeCanvas;
  // ...
}
// ...
base class _NativeCanvas extends NativeFieldWrapperClass1 implements Canvas {
  // ...
  @override
  void drawRect(Rect rect, Paint paint) {
    assert(_rectIsValid(rect));
    _drawRect(rect.left, rect.top, rect.right, rect.bottom, paint._objects, paint._data);
  }
  // ...
  @Native<Void Function(Pointer<Void>, Double, Double, Double, Double, Handle, Handle)>(symbol: 'Canvas::drawRect')
  external void _drawRect(double left, double top, double right, double bottom, List<Object?>? paintObjects, ByteData paintData);
  // ...
}
// ...''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'lib/ui/painting.dart',
      language: Language.dart,
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
          'https://github.com/flutter/engine/blob/11d66db97d3f0b010d26441f7ca83c7c3fa1fc67/lib/ui/painting.dart#L4944',
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
`Canvas` クラスは抽象クラスで定義されており
factory コンストラクタで `_NativeCanvas` クラスのコンストラクタを呼び出してインスタンスを作成しています。

肝心の `drawRect()` メソッドで、`_drawRect()` というメソッドに
`paint` の `_objects` を渡して呼び出しています。

`_drawRect()` メソッドは ffi を使って C++ 側の `Canvas::drawRect()` メソッドを呼び出しています。
C++ 側のコードも少し見てみると''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
