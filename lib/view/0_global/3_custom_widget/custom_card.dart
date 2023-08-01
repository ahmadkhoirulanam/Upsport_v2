// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';

class CustomCard extends StatelessWidget {
  final int? styleId;
  final double? height;
  final double? width;
  final double? topmargin;
  final double? bottommargin;
  final double? leftmargin;
  final double? rightmargin;
  final double? allmargin;
  final double? toppadding;
  final double? bottompadding;
  final double? leftpadding;
  final double? rightpadding;
  final double? allpadding;
  final Widget? child;

  CustomCard({
    this.styleId,
    @required this.child,
    this.height,
    this.width,
    this.topmargin,
    this.bottommargin,
    this.leftmargin,
    this.rightmargin,
    this.allmargin,
    this.toppadding,
    this.bottompadding,
    this.leftpadding,
    this.rightpadding,
    this.allpadding,
  });
  @override
  Widget build(BuildContext context) {
    final int initStyleId = styleId ?? 1;
    style1() {
      return BoxDecoration(
          color: Warna().accentTransparentColor(),
          border: Border.all(
              width: getW(context, 0.007), color: Warna().accentColor()),
          borderRadius: defaultBorderRadius(context));
    }

    style2() {
      return BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              width: getW(context, 0.005),
              color: Warna().accentTransparentColor()),
          borderRadius: BorderRadius.circular(getW(context, 0.03)));
    }

    styleInitial() {
      if (initStyleId == 1) {
        return style1();
      } else {
        return style2();
      }
    }

    return Container(
        height: height != null ? getW(context, height!) : null,
        width: width != null ? getW(context, width!) : null,
        padding: allpadding != null
            ? EdgeInsetsDirectional.all(getW(context, allpadding!))
            : EdgeInsets.only(
                top: getW(context, toppadding ?? 0.02),
                bottom: getW(context, bottompadding ?? 0.02),
                left: getW(context, leftpadding ?? 0.02),
                right: getW(context, rightpadding ?? 0.02)),
        margin: allmargin != null
            ? EdgeInsetsDirectional.all(getW(context, allmargin!))
            : EdgeInsets.only(
                top: getW(context, topmargin ?? 0.0),
                bottom: getW(context, bottommargin ?? 0.0),
                left: getW(context, leftmargin ?? 0.0),
                right: getW(context, rightmargin ?? 0.0)),
        decoration: styleInitial(),
        child: child!);
  }
}
