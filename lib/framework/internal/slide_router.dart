import 'package:collection/collection.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:go_router/go_router.dart';

final class SlideRouter {
  SlideRouter({
    required List<SlideStatelessWidget> slides,
  }) : _slides = slides;

  final List<SlideStatelessWidget> _slides;

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
      initialLocation: routes.first.path,
      routes: routes,
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
  }

  void next() {
    final currentIndex = this.currentIndex;

    assert(currentIndex > -1, 'No slide found.');

    final nextIndex = currentIndex + 1;
    if (nextIndex >= _slideRoutes.length) return;

    final slideRoute = _slideRoutes[nextIndex];
    routerConfig.go(slideRoute.path);
  }

  void goToSlide(int index) {
    if (index < 0 || index >= _slideRoutes.length) return;

    final slideRoute = _slideRoutes[index];
    routerConfig.go(slideRoute.path);
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
