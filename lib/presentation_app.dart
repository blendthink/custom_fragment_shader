import 'package:custom_fragment_shader/app_slides.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';

final class PresentationApp extends StatefulWidget {
  const PresentationApp({
    required int initSlideIndex,
    super.key,
  }) : _initSlideIndex = initSlideIndex;

  final int _initSlideIndex;

  @override
  State<PresentationApp> createState() => _PresentationAppState();
}

class _PresentationAppState extends State<PresentationApp> {
  late int _slideIndex = widget._initSlideIndex;

  @override
  void initState() {
    super.initState();
    DesktopMultiWindow.setMethodHandler((call, fromWindowId) async {
      final callMethod = call.method;
      if (callMethod != 'updateSlideIndex') {
        return;
      }
      final slideIndex = call.arguments as int?;
      if (slideIndex == null) {
        return;
      }
      if (!context.mounted) {
        return;
      }
      setState(() {
        _slideIndex = slideIndex;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final speakerNote = appSlides[_slideIndex].speakerNote;
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        DesktopMultiWindow.invokeMethod(0, "previous");
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    IconButton(
                      onPressed: () {
                        DesktopMultiWindow.invokeMethod(0, "next");
                      },
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
                Text(
                  speakerNote,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
