import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

// ignore: non_constant_identifier_names
CustomAlertDialog(
  BuildContext context, {
  double? width,
  String? title,
  String? contentText,
  Widget? customBody,
  IconData? contentIcon,
  Widget? contentWidget,
  double? contentWidgetHeight,
  bool? contentFitHeight,
  String? txtButton1,
  String? txtButton2,
  String? txtButton3,
  double? elevation,
  Color? backgroundColor,
  bool? dismissable,
  IconData? iconHeader,
  VoidCallback? funcButton1,
  VoidCallback? funcButton2,
  VoidCallback? funcButton3,
  VoidCallback? funcExitApp,
  VoidCallback? funcDismiss,
  VoidCallback? funcWillPop,
}) {
  return NAlertDialog(
    dismissable: dismissable ?? true,
    dialogStyle: DialogStyle(backgroundColor: Colors.transparent, elevation: 0),
    onDismiss: () => funcDismiss != null ? funcDismiss() : null,
    content: WillPopScope(
      onWillPop: () async {
        if (funcWillPop != null) funcWillPop();
        return false;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: getW(context, width ?? 0.7),
            padding: customBody != null
                ? null
                : EdgeInsets.fromLTRB(
                    getW(context, 0.04),
                    getW(context, iconHeader != null ? 0.15 : 0.04),
                    getW(context, 0.04),
                    getW(context, 0.04)),
            decoration: BoxDecoration(
              color: backgroundColor ?? Warna().backgroundColor(),
              borderRadius: BorderRadius.circular(getW(context, 0.1)),
            ),
            child: SingleChildScrollView(
              child: customBody ??
                  Stack(
                    children: [
                      if (iconHeader != null)
                        Align(
                          alignment: Alignment.topCenter,
                          child: WidgetTween(
                            y: -getW(context, 0.27),
                            child: CircleAvatar(
                              backgroundColor: Warna().accentColor(),
                              radius: getW(context, 0.12),
                              child: Icon(
                                iconHeader,
                                size: getW(context, 0.1),
                              ),
                            ),
                          ),
                        ),
                      WidgetTween(
                        // y: iconHeader != null ? -getW(context, 0.05) : 0,
                        child: Column(
                          children: [
                            if (title != null)
                              CustomText(
                                botpad: 0.02,
                                txt: title,
                                bold: true,
                                size: 0.04,
                              ),
                            if (contentIcon != null)
                              Icon(
                                contentIcon,
                                size: getW(context, 0.2),
                                color: Warna().accentColor(),
                              ),
                            if (contentWidget != null)
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: getW(context, 0.02)),
                                height: (contentFitHeight != null &&
                                        contentFitHeight == true)
                                    ? null
                                    : getW(context, contentWidgetHeight ?? 0.4),
                                child: contentWidget,
                              ),
                            if (contentText != null)
                              CustomText(
                                botpad: 0.02,
                                txt: contentText,
                                size: 0.036,
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                if (txtButton1 != null)
                                  CustomButton(
                                    styleId: 1,
                                    onPress: () {
                                      if (funcExitApp != null) {
                                        funcExitApp();
                                      } else {
                                        Navigator.pop(context);
                                        if (funcButton1 != null) funcButton1();
                                      }
                                    },
                                    text: txtButton1,
                                  ),
                                if (txtButton2 != null)
                                  CustomButton(
                                    styleId: 1,
                                    onPress: () {
                                      Navigator.pop(context);
                                      if (funcButton2 != null) funcButton2();
                                    },
                                    text: txtButton2,
                                  ),
                                if (txtButton3 != null)
                                  CustomButton(
                                    styleId: 1,
                                    onPress: () {
                                      Navigator.pop(context);
                                      if (funcButton3 != null) funcButton3();
                                    },
                                    text: txtButton3,
                                  )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
            ),
          ),
        ],
      ),
    ),
    blur: 0,
  ).show(context,
      transitionType: DialogTransitionType.Bubble,
      transitionDuration: Duration(milliseconds: 500));
}
