import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:flutter/material.dart';

final class ImplementationFlowTitle extends StatelessWidget {
  const ImplementationFlowTitle({
    required int index,
    required String title,
    bool isHighlight = false,
    super.key,
  })  : _isHighlight = isHighlight,
        _title = title,
        _index = index;

  final int _index;
  final String _title;
  final bool _isHighlight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        const ScalerGap(12),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: _isHighlight ? Colors.pinkAccent : Colors.transparent,
              width: 4 * context.frameScale,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          child: Text(
            '$_index. $_title',
            style: theme.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
