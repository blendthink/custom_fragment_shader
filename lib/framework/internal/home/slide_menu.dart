import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:custom_fragment_shader/framework/internal/slide_framework.dart';
import 'package:flutter/material.dart';

final class SlideMenu extends StatelessWidget {
  const SlideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final menuValueNotifier = context.framework.menuValueNotifier;
    return ValueListenableBuilder(
      valueListenable: menuValueNotifier,
      builder: (context, shouldShowMenu, _) {
        final menuHeight = context.menuHeight;
        return AnimatedPositioned(
          height: menuHeight,
          left: 0,
          right: 0,
          bottom: shouldShowMenu ? 0 : -menuHeight,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: const _Menu(),
        );
      },
    );
  }
}

final class MenuValueNotifier extends ValueNotifier<bool> {
  MenuValueNotifier() : super(false);

  void toggle() {
    value = !value;
  }
}

final class _Menu extends StatelessWidget {
  const _Menu();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.amber,
    );
  }
}
