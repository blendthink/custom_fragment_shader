import 'package:custom_fragment_shader/components/scaler_gap.dart';
import 'package:custom_fragment_shader/framework/slide_widget.dart';
import 'package:custom_fragment_shader/slides/components/agenda/agenda_header.dart';
import 'package:custom_fragment_shader/slides/components/agenda/agenda_title.dart';
import 'package:custom_fragment_shader/slides/data/agenda.dart';
import 'package:flutter/material.dart';

final class AgendaSlide extends SlideStatelessWidget {
  const AgendaSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ScalerGap(36),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScalerGap(12),
            AgendaHeader(),
            AgendaTitle(Agenda.agenda01),
            AgendaTitle(Agenda.agenda02),
            AgendaTitle(Agenda.agenda03),
            AgendaTitle(Agenda.agenda04),
            ScalerGap(72),
          ],
        ),
      ],
    );
  }
}
