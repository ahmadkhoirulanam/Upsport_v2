// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

///Horizontal Style
class CustomButton extends StatelessWidget {
  final int? styleId;
  final int? fontId;
  final double? verPadding;
  final double? horPadding;
  final double? verMargin;
  final double? horMargin;
  final double? leftMargin;
  final double? rightMargin;
  final double? topMargin;
  final double? botMargin;
  final double? height;
  final double? width;
  final double? borderRadius;
  final String? text;
  final String? text2;
  final Widget? customBody;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? prefixWidget;
  final double? prefixIconPadding;
  final double? suffixIconPadding;
  final double? iconSize;
  final bool? disableButton;
  final bool? verticalAlign;
  final bool? alignRight;
  final bool? alignLeft;
  final VoidCallback? onPress;
  final Color? colorText;
  final Color? colorAccent;
  final Color? colorIcon;
  const CustomButton(
      {this.text,
      this.text2,
      this.styleId,
      this.fontId,
      @required this.onPress,
      this.customBody,
      this.height,
      this.width,
      this.borderRadius,
      this.disableButton,
      this.prefixIcon,
      this.suffixIcon,
      this.prefixWidget,
      this.prefixIconPadding,
      this.suffixIconPadding,
      this.iconSize,
      this.verPadding,
      this.horPadding,
      this.verMargin,
      this.horMargin,
      this.leftMargin,
      this.rightMargin,
      this.topMargin,
      this.verticalAlign,
      this.botMargin,
      this.colorText,
      this.alignLeft,
      this.alignRight,
      this.colorAccent,
      this.colorIcon});

  @override
  Widget build(BuildContext context) {
    bool initDisableButton = disableButton ?? false;
    bool initVerticalAlign = verticalAlign ?? false;
    return Container(
      width: width != null ? getW(context, width!) : null,
      height: height != null ? getW(context, height!) : null,
      padding: EdgeInsets.symmetric(
          vertical: getW(context, verPadding ?? 0),
          horizontal: getW(context, horPadding ?? 0)),
      margin: EdgeInsets.only(
          top: getW(context, topMargin ?? 0),
          bottom: getW(context, botMargin ?? 0),
          left: getW(context, leftMargin ?? 0),
          right: getW(context, rightMargin ?? 0)),
      child: buttonStyleSelected(context,
          initDisableButton: initDisableButton,
          body: customBody != null
              ? customBody!
              : initVerticalAlign
                  ? verticalLayout(context,
                      initDisableButton: initDisableButton)
                  : horizontalLayout(context,
                      initDisableButton: initDisableButton)),
    );
  }

  Color colorTextStyle() {
    if (colorText != null) {
      return colorText!;
    } else {
      if (styleId == null || styleId == 1) {
        return Colors.white;
      } else if (styleId! == 5) {
        return Warna().fontColor1();
      } else if (styleId! >= 2 && styleId! <= 6) {
        return Warna().accentColor();
      } else {
        return Warna().accentColor();
      }
    }
  }

  Color colorAccentStyle() {
    if (colorAccent != null) {
      return colorAccent!;
    } else {
      if (styleId == null || styleId == 1) {
        return Warna().accentColor();
      } else if (styleId! == 2 || styleId == 5 || styleId == 6) {
        return Colors.transparent;
      } else if (styleId! == 3 || styleId == 4) {
        return Warna().accentTransparentColor();
      } else {
        return Warna().accentColor();
      }
    }
  }

  Color colorIconStyle() {
    if (colorIcon != null) {
      return colorIcon!;
    } else {
      if (styleId == null || styleId == 1) {
        return Colors.white;
      } else if (styleId! >= 2 && styleId! <= 6) {
        return Warna().accentColor();
      } else {
        return Colors.black;
      }
    }
  }

  int fontIdInitial() {
    if (fontId != null) {
      return fontId!;
    } else {
      if (styleId == null || styleId! >= 1 && styleId! <= 5) {
        return 2;
      } else {
        return 1;
      }
    }
  }

  horizontalLayout(BuildContext context, {@required bool? initDisableButton}) {
    return Row(
      mainAxisAlignment: (alignLeft != null && alignLeft == true)
          ? MainAxisAlignment.start
          : (alignRight != null && alignRight == true)
              ? MainAxisAlignment.end
              : MainAxisAlignment.center,
      children: [
        if (prefixWidget != null) prefixWidget!,
        if (prefixIcon != null)
          Icon(
            prefixIcon,
            color: colorIconStyle(),
            size: getW(context, iconSize ?? 0.05),
          ),
        if (text != null)
          CustomText(
            txt: text,
            color: colorTextStyle(),
            fontId: fontIdInitial(),
            leftpad: prefixIconPadding ?? 0.0,
            rightpad: suffixIconPadding ?? 0.0,
            bold: false,
          ),
        if (suffixIcon != null)
          Icon(
            suffixIcon,
            color: colorIconStyle(),
            size: getW(context, iconSize ?? 0.05),
          ),
      ],
    );
  }

  verticalLayout(BuildContext context, {@required bool? initDisableButton}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: (alignLeft != null && alignLeft == true)
          ? CrossAxisAlignment.start
          : (alignRight != null && alignRight == true)
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center,
      children: [
        if (prefixWidget != null) prefixWidget!,
        if (prefixIcon != null)
          Icon(
            prefixIcon,
            color: colorIconStyle(),
            size: getW(context, iconSize ?? 0.06),
          ),
        if (text != null)
          CustomText(
            txt: text,
            color: initDisableButton! ? Colors.grey : colorTextStyle(),
            fontId: fontIdInitial(),
            botpad: prefixIconPadding ?? 0.0,
            toppad: suffixIconPadding ?? 0.0,
            bold: false,
          ),
        if (suffixIcon != null)
          Icon(
            suffixIcon,
            color: colorIconStyle(),
            size: getW(context, iconSize ?? 0.06),
          ),
      ],
    );
  }

  buttonStyleSelected(BuildContext context,
      {@required bool? initDisableButton, @required Widget? body}) {
    bool initBorderRadius = borderRadius != null ? true : false;
    style1() {
      return RawMaterialButton(
          padding: EdgeInsets.symmetric(
              vertical: getW(context, verPadding ?? 0.0),
              horizontal: getW(context, horPadding ?? 0)),
          onPressed: () => onPress!(),
          shape: initBorderRadius
              ? RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(getW(context, borderRadius!)))
              : const StadiumBorder(),
          fillColor: colorAccentStyle(),
          splashColor: Colors.transparent,
          highlightColor: Colors.white12,
          elevation: 0,
          highlightElevation: 0,
          child: body!);
    }

    style2() {
      return RawMaterialButton(
          padding: EdgeInsets.symmetric(
              vertical: getW(context, verPadding ?? 0.0),
              horizontal: getW(context, horPadding ?? 0)),
          onPressed: () => onPress!(),
          shape: initBorderRadius
              ? RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(getW(context, borderRadius!)))
              : const StadiumBorder(),
          fillColor: colorAccentStyle(),
          splashColor: Colors.transparent,
          highlightColor: Colors.white12,
          elevation: 0,
          highlightElevation: 0,
          child: body!);
    }

    style3() {
      return RawMaterialButton(
          padding: EdgeInsets.symmetric(
              vertical: getW(context, verPadding ?? 0.0),
              horizontal: getW(context, horPadding ?? 0)),
          onPressed: () => onPress!(),
          shape: initBorderRadius
              ? RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(getW(context, borderRadius!)))
              : const StadiumBorder(),
          fillColor: colorAccentStyle(),
          splashColor: Colors.transparent,
          highlightColor: Colors.white12,
          elevation: 0,
          highlightElevation: 0,
          child: body!);
    }

    style4() {
      return RawMaterialButton(
          padding: EdgeInsets.symmetric(
              vertical: getW(context, verPadding ?? 0.0),
              horizontal: getW(context, horPadding ?? 0)),
          onPressed: () => onPress!(),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(getW(context, borderRadius ?? 1)),
              side: BorderSide(
                  width: getW(context, 0.006), color: Warna().accentColor())),
          fillColor: colorAccentStyle(),
          splashColor: Colors.transparent,
          highlightColor: Colors.white12,
          elevation: 0,
          highlightElevation: 0,
          child: body!);
    }

    style5() {
      return RawMaterialButton(
          padding: EdgeInsets.symmetric(
              vertical: getW(context, verPadding ?? 0.0),
              horizontal: getW(context, horPadding ?? 0.02)),
          onPressed: () => onPress!(),
          shape: initBorderRadius
              ? RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(getW(context, borderRadius!)))
              : const StadiumBorder(),
          // fillColor: colorAccentStyle(),
          splashColor: Colors.transparent,
          highlightColor: Colors.white12,
          elevation: 0,
          highlightElevation: 0,
          child: Column(
            children: [
              customBody ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (prefixWidget != null) prefixWidget!,
                      if (prefixIcon != null)
                        Padding(
                          padding: EdgeInsets.only(right: getW(context, 0.025)),
                          child: Icon(
                            prefixIcon,
                            color: Warna().accentColor(),
                            size: getW(context, iconSize ?? 0.05),
                          ),
                        ),
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (text != null)
                                    CustomText(
                                      txt: text,
                                      color: Warna().fontColor1(),
                                      fontId: 2,
                                      bold: false,
                                    ),
                                  if (text2 != null)
                                    CustomText(
                                      txt: text2!,
                                      color: Colors.grey,
                                    ),
                                ],
                              ))),
                      if (suffixIcon != null)
                        Icon(
                          suffixIcon,
                          color: Warna().accentColor(),
                          size: getW(context, iconSize ?? 0.05),
                        ),
                    ],
                  ),
              Divider(
                height: getW(context, 0.08),
                thickness: getW(context, 0.003),
              )
            ],
          ));
    }

    style6() {
      return RawMaterialButton(
          padding: EdgeInsets.symmetric(
              vertical: getW(context, verPadding ?? 0.0),
              horizontal: getW(context, horPadding ?? 0)),
          onPressed: () => onPress!(),
          fillColor: colorAccentStyle(),
          splashColor: Colors.transparent,
          highlightColor: Colors.white12,
          elevation: 0,
          highlightElevation: 0,
          child: body!);
    }

    style7() {
      return RawMaterialButton(
          padding: EdgeInsets.symmetric(
              vertical: getW(context, verPadding ?? 0.0),
              horizontal: getW(context, horPadding ?? 0.02)),
          onPressed: () => onPress!(),
          shape: initBorderRadius
              ? RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(getW(context, borderRadius!)))
              : const StadiumBorder(),
          splashColor: Colors.transparent,
          highlightColor: Colors.white12,
          elevation: 0,
          highlightElevation: 0,
          child: customBody ??
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (prefixIcon != null)
                    Padding(
                      padding: EdgeInsets.only(right: getW(context, 0.025)),
                      child: Icon(
                        prefixIcon,
                        color: Warna().accentColor(),
                        size: getW(context, iconSize ?? 0.05),
                      ),
                    ),
                  if (text != null)
                    CustomText(
                      txt: text,
                      color: Warna().fontColor1(),
                      fontId: 2,
                      bold: false,
                    ),
                  if (suffixIcon != null)
                    Icon(
                      suffixIcon,
                      color: Warna().accentColor(),
                      size: getW(context, iconSize ?? 0.05),
                    ),
                ],
              ));
    }

    style8() {
      return RawMaterialButton(
          padding: EdgeInsets.symmetric(
              vertical: getW(context, verPadding ?? 0.0),
              horizontal: getW(context, horPadding ?? 0.02)),
          onPressed: () => onPress!(),
          shape: initBorderRadius
              ? RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(getW(context, borderRadius!)))
              : const StadiumBorder(),
          // fillColor: colorAccentStyle(),
          splashColor: Colors.transparent,
          highlightColor: Colors.white12,
          elevation: 0,
          highlightElevation: 0,
          child: Column(
            children: [
              customBody ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (prefixIcon != null)
                        Padding(
                          padding: EdgeInsets.only(right: getW(context, 0.025)),
                          child: Icon(
                            prefixIcon,
                            color: Warna().accentColor(),
                            size: getW(context, iconSize ?? 0.05),
                          ),
                        ),
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (text != null)
                                    CustomText(
                                      txt: text,
                                      color: Warna().fontColor1(),
                                      fontId: 2,
                                      bold: false,
                                    ),
                                  if (text2 != null)
                                    CustomText(
                                      txt: text2!,
                                      color: Colors.grey,
                                    ),
                                ],
                              ))),
                      if (suffixIcon != null)
                        Icon(
                          suffixIcon,
                          color: Warna().accentColor(),
                          size: getW(context, iconSize ?? 0.05),
                        ),
                    ],
                  ),
            ],
          ));
    }

    styleReturn() {
      if (styleId == null || styleId == 1) {
        return style1();
      } else if (styleId == 2) {
        return style2();
      } else if (styleId == 3) {
        return style3();
      } else if (styleId == 4) {
        return style4();
      } else if (styleId == 5) {
        return style5();
      } else if (styleId == 6) {
        return style6();
      } else if (styleId == 7) {
        return style7();
      } else {
        return style8();
      }
    }

    return styleReturn();
  }
}
