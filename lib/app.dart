import 'package:custom_fragment_shader/framework/slide_app.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:flutter/material.dart';

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const slides = <SlideStatelessWidget>[];
    return SlideApp(
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      slides: slides,
    );
  }
}
