import 'package:sport/main.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/1_value/variable.dart';
import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_alert_dialog.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: non_constant_identifier_names
CustomLoadingDialog(
    {Widget? customSpinKit,
    bool? dismissable,
    String? teksLoading,
    IconData? customIcon}) {
  return CustomAlertDialog(navKey.currentContext!,
      dismissable: dismissable ?? false,
      backgroundColor: Colors.transparent,
      elevation: 0, funcDismiss: () {
    Navigator.pop(navKey.currentContext!);
  },
      contentWidget: customSpinKit ??
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: getW(navKey.currentContext!, 0.2),
                    height: getW(navKey.currentContext!, 0.2),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(
                            getW(navKey.currentContext!, 1))),
                    child: SpinKitCubeGrid(
                      color: Warna().accentColor(),
                      size: getW(navKey.currentContext!, 0.2),
                    ),
                  ),
                  SizedBox(
                    width: getW(navKey.currentContext!, 0.1),
                    child: customIcon != null
                        ? Icon(
                            customIcon,
                            color: Warna().accentColor(),
                            size: getW(navKey.currentContext!, 0.12),
                          )
                        : ImgLoader.logoApp,
                  )
                ],
              ),
              if (teksLoading != null)
                CustomText(
                  txt: teksLoading,
                  toppad: 0.03,
                  color: Colors.white,
                )
            ],
          ));
}
