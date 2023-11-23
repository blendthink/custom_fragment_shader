import 'package:custom_fragment_shader/components/reference.dart';
import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/gen/assets.gen.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';

final class Agenda01DiffBetweenCpuAndGpuSlide extends SlideStatelessWidget {
  const Agenda01DiffBetweenCpuAndGpuSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageWidth = 168 * context.frameScale;
    final body = Column(
      children: [
        const ScalerGap(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CPU',
              style: theme.textTheme.titleLarge,
            ),
            const ScalerGap(72),
            Text(
              'vs',
              style: theme.textTheme.titleMedium,
            ),
            const ScalerGap(72),
            Text(
              'GPU',
              style: theme.textTheme.titleLarge,
            ),
          ],
        ),
        const ScalerGap(36),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.agenda01.cpu.image(
              width: imageWidth,
              fit: BoxFit.fitWidth,
            ),
            const ScalerGap(36),
            Assets.agenda01.gup.image(
              width: imageWidth,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
        const ScalerGap(36),
        const Reference('https://thebookofshaders.com/01/'),
      ],
    );

    return TitleHeaderSlide(
      title: Agenda.agenda01,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
こちらの２つの画像をご覧ください。
左が CPU で、右が GPU の処理を表しています。

CPU の方は管が１本しかなく、その１本の管で１つずつ処理を行っていることが分かります。
対して、GPU の方は管が複数本あり、同時に複数の処理を行っていることが分かります。

最近では、CPU も数個から数十個程度の複数のコアが主流になっており、ある程度の並列処理は行うことができます。
しかし、GPU のコアの数は数千個にもおよぶため、より大量のデータを並列処理で実行可能になります。

ちなみに フル HD のピクセル数は 1920 × 1080 で約 20 万にもおよびます。
さらに最近では、4K や 8K といった、より高解像度のディスプレイも登場して、それは 300 万をも超えるピクセル数になります。

そのため、今後はより一層、GPU 上での処理を行うことが重要になってくると考えられます。''';
}
