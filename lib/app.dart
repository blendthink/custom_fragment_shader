import 'package:custom_fragment_shader/app_slides.dart';
import 'package:custom_fragment_shader/framework/slide_app.dart';
import 'package:custom_fragment_shader/theme.dart';
import 'package:flutter/material.dart';

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideApp(
      theme: appTheme,
      slides: appSlides,
    );
  }
}
