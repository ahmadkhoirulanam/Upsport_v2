// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/1_value/textstyle_value.dart';

class CustomText extends StatelessWidget {
  final String? txt;
  final Color? color;
  final double? size;
  final bool? bold;
  final int? maxLines;
  final bool? semibold;
  final int? fontId;
  final IconData? prefixIcon;
  final Color? iconColor;
  final double? iconSize;
  final double? iconSpacing;
  final TextAlign? textAlign;
  final Alignment? align;
  final TextOverflow? overflow;
  final double? spacing;
  final double? width;
  final double? height;
  final double? toppad;
  final double? botpad;
  final double? leftpad;
  final double? rightpad;

  ///font Id = 1:HelveticaNeue, 2:Poppins
  CustomText(
      {@required this.txt,
      this.color,
      this.size,
      this.bold,
      this.maxLines,
      this.semibold,
      this.fontId,
      this.prefixIcon,
      this.iconColor,
      this.iconSize,
      this.iconSpacing,
      this.textAlign,
      this.align,
      this.overflow,
      this.spacing,
      this.width,
      this.height,
      this.toppad,
      this.botpad,
      this.leftpad,
      this.rightpad});
  @override
  Widget build(BuildContext context) {
    bool initbold = bold == null ? false : bold!;
    bool initsemibold = semibold == null ? false : semibold!;
    contentContainer({@required child}) {
      return Container(
          alignment: textAlign == TextAlign.center ? Alignment.center : null,
          width: width != null ? getW(context, width!) : null,
          height: height != null ? getW(context, height!) : null,
          margin: EdgeInsets.only(
            top: getW(context, toppad != null ? toppad! : 0),
            bottom: getW(context, botpad != null ? botpad! : 0),
            left: getW(context, leftpad != null ? leftpad! : 0),
            right: getW(context, rightpad != null ? rightpad! : 0),
          ),
          child: child);
    }

    contentText() {
      return Text(
        txt!,
        textAlign: textAlign ?? TextAlign.start,
        overflow: overflow != null ? overflow! : TextOverflow.clip,
        maxLines: maxLines != null ? maxLines! : null,
        style: textStyle(
          context,
          fontId: fontId,
          spacing: spacing ?? 0,
          txtColor: color ?? Warna().fontColor1(),
          txtWeight: initbold == true
              ? FontWeight.bold
              : initsemibold == true
                  ? FontWeight.w600
                  : FontWeight.normal,
          txtSize: getW(context, size != null ? size! : 0.034),
        ),
      );
    }

    contentMain() {
      return prefixIcon != null
          ? contentContainer(
              child: Row(
              children: [
                Container(
                  width: getW(context, iconSpacing ?? 0.05),
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    prefixIcon!,
                    color: iconColor ?? Warna().fontColor1(),
                    size: getW(context, iconSize != null ? iconSize! : 0.035),
                  ),
                ),
                contentText(),
              ],
            ))
          : contentContainer(child: contentText());
    }

    return align != null
        ? Align(
            alignment: align!,
            child: contentMain(),
          )
        : contentMain();
  }
}
