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
  textColor: Color(0xffffffff),
  backgroundColor: Color(0xff282b2e),
  fileNameTextColor: Color(0xffffffff),
  fileNameBackgroundColor: Color(0x66808080),
  textStyles: {
    'number': TextStyle(color: Color(0xff24A0FF)),
    'literal': TextStyle(color: Color(0xff24A0FF)),
    'symbol': TextStyle(color: Color(0xff24A0FF)),
    'bullet': TextStyle(color: Color(0xff24A0FF)),
    'keyword': TextStyle(color: Color(0xffff7300)),
    'selector-tag': TextStyle(color: Color(0xffff7300)),
    'deletion': TextStyle(color: Color(0xffff7300)),
    'variable': TextStyle(color: Color(0xff2feb00)),
    'template-variable': TextStyle(color: Color(0xff2feb00)),
    'link': TextStyle(color: Color(0xff2feb00)),
    'comment': TextStyle(color: Color(0xff808080)),
    'quote': TextStyle(color: Color(0xff808080)),
    'meta': TextStyle(color: Color(0xffe5de00)),
    'string': TextStyle(color: Color(0xff52e000)),
    'attribute': TextStyle(color: Color(0xff52e000)),
    'addition': TextStyle(color: Color(0xff52e000)),
    'section': TextStyle(color: Color(0xffffc66d)),
    'title': TextStyle(color: Color(0xffffc66d)),
    'type': TextStyle(color: Color(0xffffc66d)),
    'name': TextStyle(color: Color(0xffffc552)),
    'selector-id': TextStyle(color: Color(0xffffc552)),
    'selector-class': TextStyle(color: Color(0xffffc552)),
    'emphasis': TextStyle(fontStyle: FontStyle.italic),
    'strong': TextStyle(fontWeight: FontWeight.bold),
  },
);

const androidStudioThemeForYaml = HighlightTheme(
  textColor: Color(0xffffffff),
  backgroundColor: Color(0xff282b2e),
  fileNameTextColor: Color(0xffffffff),
  fileNameBackgroundColor: Color(0x66808080),
  textStyles: {
    'attr': TextStyle(color: Color(0xffff7300)),
    'meta': TextStyle(color: Color(0xffff7300)),
    'comment': TextStyle(color: Color(0xff808080)),
    'string': TextStyle(color: Color(0xff52e000)),
  },
);
