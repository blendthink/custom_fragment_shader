import 'package:flutter/material.dart';

final class SlideBackground extends StatelessWidget {
  const SlideBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF602678),
              Color(0xFF1D192B),
            ],
          ),
        ),
      ),
    );
  }
}
