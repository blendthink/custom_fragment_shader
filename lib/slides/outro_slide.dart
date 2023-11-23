import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

final class OutroSlide extends SlideStatelessWidget {
  const OutroSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final qrSize = 160 * context.frameScale;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Thank you for watching',
          style: textTheme.displaySmall,
        ),
        const ScalerGap(32),
        QrImageView(
          data: 'https://github.com/blendthink/custom_fragment_shader',
          size: qrSize,
          backgroundColor: Colors.white,
        ),
      ],
    );
  }

  @override
  String get speakerNote => '''
いかがでしたでしょうか。

難しい部分はありつつも、個人的には、仕組みや Shader プログラミングへの理解があれば、思っているよりも簡単に、より柔軟で高度な UI を実現することができると考えています。

この資料は GitHub にアップしていますので、興味ある方はこちらの QR コードを読み取っていただければと思います。
ご清聴ありがとうございました。''';
}
