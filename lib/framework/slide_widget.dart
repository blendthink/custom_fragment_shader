import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract base class SlideStatelessWidget extends StatelessWidget {
  const SlideStatelessWidget({super.key});

  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );

  String get speakerNote => '';
}
