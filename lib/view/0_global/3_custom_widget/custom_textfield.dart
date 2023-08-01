// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/1_value/textstyle_value.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? hint2;
  final double? fSize;
  final TextAlign? textAlign;
  final bool? readonly;
  final bool? autoFocus;
  final int? maxlines;
  final double? minHeight;
  final int? maxLength;
  final bool? obsecure;
  final double? width;
  final double? height;
  final int? styleId;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final Color? suffixIconColor;
  final Color? borderColor;
  final double? borderRadius;
  final VoidCallback? onChanged;
  final VoidCallback? onTap;
  final TextInputType? keyboardtype;
  final TextInputAction? keyboardAction;
  CustomTextField(
      {this.controller,
      this.hint,
      this.hint2,
      this.fSize,
      this.textAlign,
      this.readonly,
      this.autoFocus,
      this.maxlines,
      this.minHeight,
      this.maxLength,
      this.obsecure,
      this.width,
      this.height,
      this.styleId,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixWidget,
      this.suffixIconColor,
      this.borderColor,
      this.borderRadius,
      this.onChanged,
      this.onTap,
      this.keyboardtype,
      this.keyboardAction});

  @override
  Widget build(BuildContext context) {
    contentTextInput() {
      return TextFormField(
        controller: controller,
        textAlign: textAlign ?? TextAlign.start,
        autofocus: autoFocus != null ? autoFocus! : false,
        onTap: () => onTap != null ? onTap!() : null,
        onChanged: (s) => onChanged != null ? onChanged!() : null,
        keyboardType: keyboardtype != null ? keyboardtype! : TextInputType.text,
        obscureText: obsecure != null ? obsecure! : false,
        readOnly: readonly != null ? readonly! : false,
        minLines: 1,
        maxLength: maxLength != null ? maxLength! : null,
        maxLines: maxlines != null ? maxlines! : 1,
        textInputAction:
            keyboardAction != null ? keyboardAction! : TextInputAction.done,
        style: textStyle(context,
            fontId: 1, txtSize: getW(context, fSize ?? 0.038)),
        decoration: InputDecoration(
          counterText: '',
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: Warna().fontColor1(),
                )
              : null,
          suffixIcon: suffixWidget != null
              ? suffixWidget!
              : suffixIcon != null
                  ? Icon(
                      suffixIcon,
                      color: suffixIconColor ?? Warna().fontColor1(),
                    )
                  : null,
          hintText: (styleId == 1 || styleId == null) ? hint ?? "" : hint2!,
          hintStyle: textStyle(context,
              fontId: 1,
              txtSize: getW(context, fSize ?? 0.038),
              txtColor: Colors.grey),
          contentPadding: (styleId == 1 || styleId == null)
              ? EdgeInsets.symmetric(
                  vertical: getW(context, 0.01),
                  horizontal: getW(context, prefixIcon != null ? 0 : 0.0))
              : EdgeInsets.all(getW(context, 0.01)),
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          ),
        ),
      );
    }

    style1() {
      return Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
              minHeight: getW(context, minHeight != null ? minHeight! : 0.1)),
          child: Column(
            children: [
              contentTextInput(),
              Divider(
                height: getW(context, 0.005),
                color: Warna().fontColor1(),
              ),
            ],
          ));
    }

    style2() {
      return Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
            minHeight: getW(context, minHeight != null ? minHeight! : 0.12)),
        decoration: BoxDecoration(
          color: Warna().accentTransparentColor(),
          borderRadius: BorderRadius.circular(getW(context, 0.02)),
        ),
        child: contentTextInput(),
      );
    }

    style3() {
      return Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
            minHeight: getW(context, minHeight != null ? minHeight! : 0.12)),
        decoration: BoxDecoration(
            color: Warna().accentTransparentColor(),
            borderRadius:
                BorderRadius.circular(getW(context, borderRadius ?? 0.02)),
            border: Border.all(
                width: getW(context, 0.006),
                color: borderColor ?? Warna().accentColor())),
        child: contentTextInput(),
      );
    }

    //================================================================================
    //Main
    //================================================================================

    styleSelect() {
      if (styleId == null) {
        return style1();
      } else {
        if (styleId == 1) {
          return style1();
        } else if (styleId == 2) {
          return style2();
        } else {
          return style3();
        }
      }
    }

    contentMain() {
      return Container(
          height: height != null ? getW(context, height!) : null,
          width: getW(context, width != null ? width! : 1),
          margin: EdgeInsets.symmetric(vertical: getW(context, 0.012)),
          child: styleSelect());
    }

    return contentMain();
  }
}
