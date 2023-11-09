import 'package:collection/collection.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_home.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final class SlideRouter {
  SlideRouter({
    required List<SlideWidget> slides,
  }) : _slides = slides;

  final List<SlideWidget> _slides;

  late final List<_SlideRoute> _slideRoutes = _slides
      .mapIndexed(
        (i, s) => _SlideRoute(
          path: '/$i',
          pageBuilder: s.pageBuilder,
        ),
      )
      .toList();

  late final GoRouter routerConfig = _buildConfig();

  GoRouter _buildConfig() {
    final routes = _slideRoutes
        .map(
          (slideRoute) => GoRoute(
            path: slideRoute.path,
            pageBuilder: slideRoute.pageBuilder,
          ),
        )
        .toList();

    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: routes.first.path,
      routes: [
        ShellRoute(
          navigatorKey: shellNavigatorKey,
          parentNavigatorKey: rootNavigatorKey,
          routes: routes,
          builder: (_, __, child) => SlideHome(
            child: child,
          ),
        ),
      ],
    );
  }

  void addListener(void Function() listener) =>
      routerConfig.routeInformationProvider.addListener(listener);

  void removeListener(void Function() listener) =>
      routerConfig.routeInformationProvider.removeListener(listener);

  void previous() {
    final currentIndex = this.currentIndex;

    assert(currentIndex > -1, 'No slide found.');

    final prevIndex = currentIndex - 1;
    if (prevIndex < 0) return;

    final slideRoute = _slideRoutes[prevIndex];
    routerConfig.go(slideRoute.path);
    DesktopMultiWindow.invokeMethod(1, "updateSlideIndex", prevIndex);
  }

  void next() {
    final currentIndex = this.currentIndex;

    assert(currentIndex > -1, 'No slide found.');

    final nextIndex = currentIndex + 1;
    if (nextIndex >= _slideRoutes.length) return;

    final slideRoute = _slideRoutes[nextIndex];
    routerConfig.go(slideRoute.path);
    DesktopMultiWindow.invokeMethod(1, "updateSlideIndex", nextIndex);
  }

  void goToSlide(int index) {
    if (index < 0 || index >= _slideRoutes.length) return;

    final slideRoute = _slideRoutes[index];
    routerConfig.go(slideRoute.path);
    DesktopMultiWindow.invokeMethod(1, "updateSlideIndex", index);
  }

  int get currentIndex => _slideRoutes.indexWhere(
        (slideRoute) => slideRoute.path == _currentUri.path,
      );

  Uri get _currentUri {
    final lastMatch = routerConfig.routerDelegate.currentConfiguration.last;
    final matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerConfig.routerDelegate.currentConfiguration;

    return matchList.uri;
  }
}

final class _SlideRoute {
  const _SlideRoute({
    required this.path,
    required this.pageBuilder,
  });

  final String path;
  final GoRouterPageBuilder pageBuilder;
}
