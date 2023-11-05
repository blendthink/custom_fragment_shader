import 'package:flutter/material.dart';

final class HighlightTheme {
  const HighlightTheme({
    required this.textColor,
    required this.backgroundColor,
    required this.fileNameTextColor,
    required this.fileNameBackgroundColor,
    required this.textStyles,
  });

  final Color textColor;
  final Color backgroundColor;
  final Color fileNameTextColor;
  final Color fileNameBackgroundColor;

  final HighlightTextStyles textStyles;
}

typedef HighlightTextStyles = Map<String, TextStyle>;

const androidStudioTheme = HighlightTheme(
  textColor: Color(0xffa9b7c6),
  backgroundColor: Color(0xff282b2e),
  fileNameTextColor: Color(0xffffffff),
  fileNameBackgroundColor: Color(0x66808080),
  textStyles: {
    'number': TextStyle(color: Color(0xff6897BB)),
    'literal': TextStyle(color: Color(0xff6897BB)),
    'symbol': TextStyle(color: Color(0xff6897BB)),
    'bullet': TextStyle(color: Color(0xff6897BB)),
    'keyword': TextStyle(color: Color(0xffcc7832)),
    'selector-tag': TextStyle(color: Color(0xffcc7832)),
    'deletion': TextStyle(color: Color(0xffcc7832)),
    'variable': TextStyle(color: Color(0xff629755)),
    'template-variable': TextStyle(color: Color(0xff629755)),
    'link': TextStyle(color: Color(0xff629755)),
    'comment': TextStyle(color: Color(0xff808080)),
    'quote': TextStyle(color: Color(0xff808080)),
    'meta': TextStyle(color: Color(0xffbbb529)),
    'string': TextStyle(color: Color(0xff6A8759)),
    'attribute': TextStyle(color: Color(0xff6A8759)),
    'addition': TextStyle(color: Color(0xff6A8759)),
    'section': TextStyle(color: Color(0xffffc66d)),
    'title': TextStyle(color: Color(0xffffc66d)),
    'type': TextStyle(color: Color(0xffffc66d)),
    'name': TextStyle(color: Color(0xffe8bf6a)),
    'selector-id': TextStyle(color: Color(0xffe8bf6a)),
    'selector-class': TextStyle(color: Color(0xffe8bf6a)),
    'emphasis': TextStyle(fontStyle: FontStyle.italic),
    'strong': TextStyle(fontWeight: FontWeight.bold),
  },
);

const androidStudioThemeForYaml = HighlightTheme(
  textColor: Color(0xffa9b7c6),
  backgroundColor: Color(0xff282b2e),
  fileNameTextColor: Color(0xffffffff),
  fileNameBackgroundColor: Color(0x66808080),
  textStyles: {
    'attr': TextStyle(color: Color(0xffcc7832)),
    'meta': TextStyle(color: Color(0xffcc7832)),
    'comment': TextStyle(color: Color(0xff808080)),
    'string': TextStyle(color: Color(0xff6A8759)),
  },
);
