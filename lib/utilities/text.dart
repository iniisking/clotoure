import 'package:flutter/material.dart';

Widget reusableText(
  String text,
  double fontSize,
  FontWeight fontWeight,
  Color color,
  double letterSpacing,
  TextAlign? textAlign,
) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
    ),
    textAlign: textAlign,
  );
}
