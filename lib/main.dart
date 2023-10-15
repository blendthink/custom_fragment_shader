import 'dart:io';

import 'package:custom_fragment_shader/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && Platform.isMacOS) {
    setWindowMinSize(const Size(640, 360));
  }
  usePathUrlStrategy();
  runApp(const App());
}
