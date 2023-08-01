// ignore: non_constant_identifier_names
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/1_value/variable.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
CustomBottomDialog(
    {@required String? txt,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Color? bgColor,
    ShapeBorder? shape,
    Color? iconColor,
    SnackBarBehavior? snackBarBehavior,
    int? durationInMilliSec}) {
  return ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(SnackBar(
      shape: shape ?? const StadiumBorder(),
      behavior: snackBarBehavior ?? SnackBarBehavior.floating,
      backgroundColor: bgColor ?? const Color.fromARGB(180, 0, 0, 0),
      duration: Duration(milliseconds: durationInMilliSec ?? 1500),
      margin: EdgeInsets.only(
          bottom: getW(navKey.currentContext!, 0.25),
          left: getW(navKey.currentContext!, 0.1),
          right: getW(navKey.currentContext!, 0.1)),
      content: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null)
              Padding(
                padding:
                    EdgeInsets.only(right: getW(navKey.currentContext!, 0.02)),
                child: Icon(
                  prefixIcon,
                  color: iconColor ?? Colors.blue.shade100,
                  size: getW(navKey.currentContext!, 0.06),
                ),
              ),
            CustomText(width: 0.7, txt: txt, color: Colors.white, bold: true),
            if (suffixIcon != null)
              Padding(
                padding:
                    EdgeInsets.only(left: getW(navKey.currentContext!, 0.02)),
                child: Icon(
                  suffixIcon,
                  color: iconColor ?? Colors.blue.shade100,
                  size: getW(navKey.currentContext!, 0.06),
                ),
              ),
          ],
        ),
      )));
}
