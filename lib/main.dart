import 'dart:convert';
import 'dart:io';

import 'package:custom_fragment_shader/app.dart';
import 'package:custom_fragment_shader/presentation_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:window_size/window_size.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (args.firstOrNull == 'multi_window' && !kIsWeb) {
    final argText = args[2];
    final argMap = jsonDecode(argText) as Map<String, dynamic>?;
    final initSlideIndex = argMap?['initSlideIndex'] as int? ?? 0;
    runApp(
      PresentationApp(
        initSlideIndex: initSlideIndex,
      ),
    );
    return;
  }

  if (!kIsWeb && Platform.isMacOS) {
    setWindowMinSize(const Size(640, 360));
  }
  usePathUrlStrategy();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/Poppins/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  await GoogleFonts.pendingFonts([
    GoogleFonts.poppinsTextTheme(),
  ]);

  ShaderBuilder.precacheShader('shaders/transition.frag');

  runApp(const App());
}
