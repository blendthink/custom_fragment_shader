import 'package:custom_fragment_shader/home_page.dart';
import 'package:custom_fragment_shader/intents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      shortcuts: _shortcuts,
      home: const HomePage(),
    );
  }
}

const _shortcuts = <ShortcutActivator, Intent>{
  SingleActivator(LogicalKeyboardKey.arrowLeft): BackIntent(),
  SingleActivator(LogicalKeyboardKey.arrowRight): NextIntent(),
  SingleActivator(LogicalKeyboardKey.period): MenuIntent(),
};
