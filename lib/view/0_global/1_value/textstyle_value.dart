import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';

textStyle(BuildContext context,
    {Color? txtColor,
    double? txtSize,
    FontWeight? txtWeight,
    FontStyle? txtStyle,
    double? spacing,
    int? fontId}) {
  String? initFontId = fontId == 1 ? "Helvetica Neue" : "Poppins";
  return TextStyle(
      color: txtColor ?? Colors.black,
      fontFamily: initFontId,
      letterSpacing: spacing ?? 0,
      fontStyle: txtStyle ?? FontStyle.normal,
      fontSize: txtSize ?? getW(context, 0.032),
      fontWeight: txtWeight ?? FontWeight.normal);
}
