/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $GoogleFontsGen {
  const $GoogleFontsGen();

  $GoogleFontsPoppinsGen get poppins => const $GoogleFontsPoppinsGen();
}

class $GoogleFontsPoppinsGen {
  const $GoogleFontsPoppinsGen();

  /// File path: google_fonts/Poppins/OFL.txt
  String get ofl => 'google_fonts/Poppins/OFL.txt';

  /// File path: google_fonts/Poppins/Poppins-Black.ttf
  String get poppinsBlack => 'google_fonts/Poppins/Poppins-Black.ttf';

  /// File path: google_fonts/Poppins/Poppins-BlackItalic.ttf
  String get poppinsBlackItalic =>
      'google_fonts/Poppins/Poppins-BlackItalic.ttf';

  /// File path: google_fonts/Poppins/Poppins-Bold.ttf
  String get poppinsBold => 'google_fonts/Poppins/Poppins-Bold.ttf';

  /// File path: google_fonts/Poppins/Poppins-BoldItalic.ttf
  String get poppinsBoldItalic => 'google_fonts/Poppins/Poppins-BoldItalic.ttf';

  /// File path: google_fonts/Poppins/Poppins-ExtraBold.ttf
  String get poppinsExtraBold => 'google_fonts/Poppins/Poppins-ExtraBold.ttf';

  /// File path: google_fonts/Poppins/Poppins-ExtraBoldItalic.ttf
  String get poppinsExtraBoldItalic =>
      'google_fonts/Poppins/Poppins-ExtraBoldItalic.ttf';

  /// File path: google_fonts/Poppins/Poppins-ExtraLight.ttf
  String get poppinsExtraLight => 'google_fonts/Poppins/Poppins-ExtraLight.ttf';

  /// File path: google_fonts/Poppins/Poppins-ExtraLightItalic.ttf
  String get poppinsExtraLightItalic =>
      'google_fonts/Poppins/Poppins-ExtraLightItalic.ttf';

  /// File path: google_fonts/Poppins/Poppins-Italic.ttf
  String get poppinsItalic => 'google_fonts/Poppins/Poppins-Italic.ttf';

  /// File path: google_fonts/Poppins/Poppins-Light.ttf
  String get poppinsLight => 'google_fonts/Poppins/Poppins-Light.ttf';

  /// File path: google_fonts/Poppins/Poppins-LightItalic.ttf
  String get poppinsLightItalic =>
      'google_fonts/Poppins/Poppins-LightItalic.ttf';

  /// File path: google_fonts/Poppins/Poppins-Medium.ttf
  String get poppinsMedium => 'google_fonts/Poppins/Poppins-Medium.ttf';

  /// File path: google_fonts/Poppins/Poppins-MediumItalic.ttf
  String get poppinsMediumItalic =>
      'google_fonts/Poppins/Poppins-MediumItalic.ttf';

  /// File path: google_fonts/Poppins/Poppins-Regular.ttf
  String get poppinsRegular => 'google_fonts/Poppins/Poppins-Regular.ttf';

  /// File path: google_fonts/Poppins/Poppins-SemiBold.ttf
  String get poppinsSemiBold => 'google_fonts/Poppins/Poppins-SemiBold.ttf';

  /// File path: google_fonts/Poppins/Poppins-SemiBoldItalic.ttf
  String get poppinsSemiBoldItalic =>
      'google_fonts/Poppins/Poppins-SemiBoldItalic.ttf';

  /// File path: google_fonts/Poppins/Poppins-Thin.ttf
  String get poppinsThin => 'google_fonts/Poppins/Poppins-Thin.ttf';

  /// File path: google_fonts/Poppins/Poppins-ThinItalic.ttf
  String get poppinsThinItalic => 'google_fonts/Poppins/Poppins-ThinItalic.ttf';

  /// List of all assets
  List<String> get values => [
        ofl,
        poppinsBlack,
        poppinsBlackItalic,
        poppinsBold,
        poppinsBoldItalic,
        poppinsExtraBold,
        poppinsExtraBoldItalic,
        poppinsExtraLight,
        poppinsExtraLightItalic,
        poppinsItalic,
        poppinsLight,
        poppinsLightItalic,
        poppinsMedium,
        poppinsMediumItalic,
        poppinsRegular,
        poppinsSemiBold,
        poppinsSemiBoldItalic,
        poppinsThin,
        poppinsThinItalic
      ];
}

class Assets {
  Assets._();

  static const SvgGenImage flutterkaigiLogo =
      SvgGenImage('assets/flutterkaigi_logo.svg');
  static const AssetGenImage pipeline01 =
      AssetGenImage('assets/pipeline01.png');
  static const AssetGenImage pipeline02 =
      AssetGenImage('assets/pipeline02.png');
  static const AssetGenImage pipeline03 =
      AssetGenImage('assets/pipeline03.png');
  static const AssetGenImage pipeline04 =
      AssetGenImage('assets/pipeline04.png');
  static const AssetGenImage pipeline05 =
      AssetGenImage('assets/pipeline05.png');
  static const AssetGenImage pipeline06 =
      AssetGenImage('assets/pipeline06.png');
  static const AssetGenImage pipeline07 =
      AssetGenImage('assets/pipeline07.png');
  static const AssetGenImage speaker = AssetGenImage('assets/speaker.png');
  static const $GoogleFontsGen googleFonts = $GoogleFontsGen();

  /// List of all assets
  List<dynamic> get values => [
        flutterkaigiLogo,
        pipeline01,
        pipeline02,
        pipeline03,
        pipeline04,
        pipeline05,
        pipeline06,
        pipeline07,
        speaker
      ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
