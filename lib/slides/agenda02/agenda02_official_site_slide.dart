import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/gen/assets.gen.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

final class Agenda02OfficialSiteSlide extends SlideStatelessWidget {
  const Agenda02OfficialSiteSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleTextStyle = theme.textTheme.titleSmall;

    final frameScale = context.frameScale;
    final imageWidth = 200 * frameScale;
    final qrSize = 100 * frameScale;

    final body = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ScalerGap(12),
            Text(
              'Official Document',
              style: titleTextStyle,
            ),
            const ScalerGap(4),
            Assets.agenda02.document.image(
              width: imageWidth,
              fit: BoxFit.fitWidth,
            ),
            const ScalerGap(12),
            QrImageView(
              data:
                  'https://docs.flutter.dev/ui/design/graphics/fragment-shaders',
              size: qrSize,
              backgroundColor: Colors.white,
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ScalerGap(12),
            Text(
              'Official YouTube',
              style: titleTextStyle,
            ),
            const ScalerGap(4),
            Assets.agenda02.youtube.image(
              width: imageWidth,
              fit: BoxFit.fitWidth,
            ),
            const ScalerGap(12),
            QrImageView(
              data: 'https://youtu.be/OpcPZdfJbq8?si=Jz74aLYSXXb9NJTC',
              size: qrSize,
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ],
    );

    return TitleHeaderSlide(
      title: Agenda.agenda02,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
公式のドキュメントページや YouTube でも Fragment Shader についての実装方法が紹介されています。
合わせてご確認いただくと、より深く理解することができると思いますので、興味のある方はぜひご覧ください。''';
}
