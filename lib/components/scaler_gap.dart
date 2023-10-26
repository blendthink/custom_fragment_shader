import 'package:custom_fragment_shader/framework/internal/home/slide_frame_query.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ScalerGap extends StatelessWidget {
  const ScalerGap(this.mainAxisExtent, {super.key});

  final double mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    return Gap(mainAxisExtent * context.frameScale);
  }
}
