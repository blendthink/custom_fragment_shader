import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract interface class SlideWidget implements Widget {
  GoRouterPageBuilder get pageBuilder;

  String get speakerNote;
}

abstract base class SlideStatelessWidget extends StatelessWidget
    implements SlideWidget {
  const SlideStatelessWidget({super.key});

  @override
  GoRouterPageBuilder get pageBuilder => (context, state) => NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: this,
      );

  @override
  String get speakerNote => '';
}
