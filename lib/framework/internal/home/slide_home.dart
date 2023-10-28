import 'package:custom_fragment_shader/framework/internal/home/slide_frame.dart';
import 'package:custom_fragment_shader/framework/internal/slide_framework.dart';
import 'package:custom_fragment_shader/framework/internal/slide_intents.dart';
import 'package:flutter/material.dart';

final class SlideHome extends StatelessWidget {
  const SlideHome({
    required Widget child,
    super.key,
  }) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Focus(
        autofocus: true,
        child: Actions(
          actions: <Type, Action<Intent>>{
            BackIntent: CallbackAction<BackIntent>(
              onInvoke: (_) => context.framework.previous(),
            ),
            NextIntent: CallbackAction<NextIntent>(
              onInvoke: (_) => context.framework.next(),
            ),
            MenuIntent: CallbackAction<MenuIntent>(
              onInvoke: (_) => context.framework.menu(),
            ),
            LicenseIntent: CallbackAction<LicenseIntent>(
              onInvoke: (_) => showLicensePage(
                context: context,
                applicationName: 'Custom Fragment Shader',
              ),
            ),
          },
          child: SlideFrame(
            child: _child,
          ),
        ),
      ),
    );
  }
}
