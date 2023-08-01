// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:sport/controller/e_get_platform_type.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:flutter/material.dart';

class BackwardButton extends StatelessWidget {
  final VoidCallback? customOnPress;
  final bool? blackColor;
  final bool? withBgColor;
  final bool? withoutMargin;
  BackwardButton(
      {this.customOnPress,
      this.blackColor,
      this.withBgColor,
      this.withoutMargin});
  bool isAndroid = PlatformType.getType() == "ios" ? true : false;
  @override
  Widget build(BuildContext context) {
    return isAndroid
        ? const SizedBox()
        : Align(
            alignment: Alignment.topLeft,
            child: CustomButton(
              width: 0.1,
              height: 0.1,
              topMargin:
                  (withoutMargin != null && withoutMargin == true) ? 0 : 0.07,
              leftMargin:
                  (withoutMargin != null && withoutMargin == true) ? 0 : 0.05,
              colorAccent: (withBgColor != null && withBgColor == true)
                  ? Warna().accentColor()
                  : Colors.transparent,
              onPress: () {
                if (customOnPress != null) {
                  customOnPress!();
                } else {
                  Navigator.pop(context);
                }
              },
              colorIcon: (blackColor != null && blackColor == true)
                  ? Colors.black
                  : Colors.white,
              prefixIcon: Icons.arrow_back_ios,
            ),
          );
  }
}
