import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _baseTheme = ThemeData.dark(
  useMaterial3: true,
);

final appTheme = _baseTheme.copyWith(
  textTheme: GoogleFonts.poppinsTextTheme(
    _baseTheme.textTheme,
  ).apply(
    fontFamilyFallback: [],
  ),
);
