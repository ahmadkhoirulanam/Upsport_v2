// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_textfield.dart';

BottomWidgetPercakapan(BuildContext context) {
  button({@required IconData? icon, @required int? buttonId}) {
    return CustomButton(
      onPress: () {},
      width: 0.1,
      height: 0.1,
      prefixIcon: icon,
    );
  }

  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: getW(context, 0.05), vertical: getW(context, 0.03)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        button(icon: Icons.camera_alt_outlined, buttonId: 1),
        CustomTextField(
          styleId: 3,
          width: 0.5,
          minHeight: 0.1,
          maxlines: 10,
          borderRadius: 0.1,
          borderColor: Colors.grey.shade300,
          hint2: "Balas..",
        ),
        button(icon: Icons.mic_none_outlined, buttonId: 2),
        button(icon: Icons.send_outlined, buttonId: 3),
      ],
    ),
  );
}
