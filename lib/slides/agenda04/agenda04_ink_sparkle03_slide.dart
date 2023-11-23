import 'package:custom_fragment_shader/components/reference.dart';
import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/data/agenda.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_theme.dart';
import 'package:custom_fragment_shader/framework/highlight/highlight_view.dart';
import 'package:custom_fragment_shader/framework/highlight/language.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/templates/title_header_slide.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class Agenda04InkSparkle03Slide extends SlideStatelessWidget {
  const Agenda04InkSparkle03Slide({super.key});

  @override
  Widget build(BuildContext context) {
    const code = '''
//...
layout(location = 0) uniform vec4 u_color;
// u_alpha, u_sparkle_alpha, u_blur, u_radius_scale
layout(location = 1) uniform vec4 u_composite_1;
layout(location = 2) uniform vec2 u_center;
layout(location = 3) uniform float u_max_radius;
layout(location = 4) uniform vec2 u_resolution_scale;
layout(location = 5) uniform vec2 u_noise_scale;
layout(location = 6) uniform float u_noise_phase;
layout(location = 7) uniform vec2 u_circle1;
layout(location = 8) uniform vec2 u_circle2;
layout(location = 9) uniform vec2 u_circle3;
layout(location = 10) uniform vec2 u_rotation1;
layout(location = 11) uniform vec2 u_rotation2;
layout(location = 12) uniform vec2 u_rotation3;
// ...
void main() {
  vec2 p = FlutterFragCoord();
  vec2 uv = p * u_resolution_scale;
  vec2 density_uv = uv - mod(p, u_noise_scale);
  float radius = u_max_radius * u_radius_scale;
  float turbulence = turbulence(uv);
  float ring = soft_ring(p, u_center, radius, 0.05 * u_max_radius, u_blur);
  float sparkle = sparkle(density_uv, u_noise_phase) * ring * turbulence * u_sparkle_alpha;
  float wave_alpha = soft_circle(p, u_center, radius, u_blur) * u_alpha * u_color.a;
  vec4 wave_color = vec4(u_color.rgb * wave_alpha, wave_alpha);
  fragColor = mix(wave_color, vec4(1.0), sparkle);
}''';

    final codeBlock = HighlightView(
      code: code,
      fileName: 'shaders/pixelation.frag',
      language: Language.glsl,
      theme: androidStudioTheme,
    );

    const rightCode = '''
// ...
  void _updateFragmentShader() {
    const double turbulenceScale = 1.5;
    final double turbulencePhase = _turbulenceSeed + _radiusScale.value;
    final double noisePhase = turbulencePhase;
    final double rotation1 = turbulencePhase * _rotateRight + 1.7 * math.pi;
    final double rotation2 = turbulencePhase * _rotateLeft + 2.0 * math.pi;
    final double rotation3 = turbulencePhase * _rotateRight + 2.75 * math.pi;

    _fragmentShader
      // uColor
      ..setFloat(0, _color.red / 255.0)
      ..setFloat(1, _color.green / 255.0)
      ..setFloat(2, _color.blue / 255.0)
      ..setFloat(3, _color.alpha / 255.0)
      // Composite 1 (u_alpha, u_sparkle_alpha, u_blur, u_radius_scale)
      ..setFloat(4, _alpha.value)
      ..setFloat(5, _sparkleAlpha.value)
      ..setFloat(6, 1.0)
      ..setFloat(7, _radiusScale.value)
      // uCenter
      ..setFloat(8, _center.value.x)
      ..setFloat(9, _center.value.y)
      // uMaxRadius
      ..setFloat(10, _targetRadius)
      // uResolutionScale
      ..setFloat(11, 1.0 / _width)
      ..setFloat(12, 1.0 / _height)
      // uNoiseScale
      ..setFloat(13, _noiseDensity / _width)
      ..setFloat(14, _noiseDensity / _height)
      // uNoisePhase
      ..setFloat(15, noisePhase / 1000.0)
      // uCircle1
      ..setFloat(16, turbulenceScale * 0.5 + (turbulencePhase * 0.01 * math.cos(turbulenceScale * 0.55)))
      ..setFloat(17, turbulenceScale * 0.5 + (turbulencePhase * 0.01 * math.sin(turbulenceScale * 0.55)))
      // uCircle2
      ..setFloat(18, turbulenceScale * 0.2 + (turbulencePhase * -0.0066 * math.cos(turbulenceScale * 0.45)))
      ..setFloat(19, turbulenceScale * 0.2 + (turbulencePhase * -0.0066 * math.sin(turbulenceScale * 0.45)))
      // uCircle3
      ..setFloat(20, turbulenceScale + (turbulencePhase * -0.0066 * math.cos(turbulenceScale * 0.35)))
      ..setFloat(21, turbulenceScale + (turbulencePhase * -0.0066 * math.sin(turbulenceScale * 0.35)))
      // uRotation1
      ..setFloat(22, math.cos(rotation1))
      ..setFloat(23, math.sin(rotation1))
      // uRotation2
      ..setFloat(24, math.cos(rotation2))
      ..setFloat(25, math.sin(rotation2))
      // uRotation3
      ..setFloat(26, math.cos(rotation3))
      ..setFloat(27, math.sin(rotation3));
  }
// ...
''';

    final rightCodeBlock = HighlightView(
      code: rightCode,
      fileName: 'lib/src/material/ink_sparkle.dart',
      language: Language.dart,
      theme: androidStudioTheme,
    );

    final body = Row(
      children: [
        Expanded(
          child: SizedBox(
            height: double.infinity,
            child: codeBlock,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(16 * context.frameScale),
            child: Column(
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: rightCodeBlock,
                  ),
                ),
                const ScalerGap(16),
                const Reference(
                  'https://github.com/flutter/flutter/blob/55868ed2a930ce8aa1c046ec9059ca077f807a94/packages/flutter/lib/src/material/ink_sparkle.dart',
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return TitleHeaderSlide(
      title: Agenda.agenda04,
      body: body,
    );
  }

  @override
  String get speakerNote => '''
ご覧のようになっていました。
左側が Fragment Shader の変数と main 関数の部分で、右側がアプリ側の Fragment Shader に値を渡している部分の実装です。

実際の処理はここで表示しているより、もっと多いため時間の都合上省略しています。
GitHub でコードは公開されていますので、もし興味ある方は後ほどご覧ください。

大まかな部分の解説だけすると

まず UV 座標へ変換しているところは同じです。

次にノイズを適用できるように準備して

最大半径にスケールを適用して、実際の半径を求めています。

その後、乱流のようなノイズを作成して

円形の輪っかのエフェクトをぼかしを含めながら作成しています。

そして、スパークルエフェクトを作成して

次に波のような円形エフェクトを作成しています。

その後、波の円形エフェクトの色を計算して

最後に波の円形エフェクトと白色の間でスパークルエフェクトに基づいてミックスしています。''';

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );
}
