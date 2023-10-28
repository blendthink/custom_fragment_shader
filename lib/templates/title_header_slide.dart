import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:flutter/material.dart';

final class TitleHeaderSlide extends StatelessWidget {
  const TitleHeaderSlide({
    required String title,
    required Widget body,
    super.key,
  })  : _title = title,
        _body = body;

  final String _title;
  final Widget _body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Header(_title),
        Divider(
          height: 8 * context.frameScale,
          thickness: 0.5 * context.frameScale,
        ),
        Expanded(
          child: _body,
        ),
      ],
    );
  }
}

final class _Header extends StatelessWidget {
  const _Header(this._title);

  final String _title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final verticalPadding = 6 * context.frameScale;
    final horizontalPadding = 12 * context.frameScale;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Text(
        _title,
        style: theme.textTheme.titleSmall,
      ),
    );
  }
}
