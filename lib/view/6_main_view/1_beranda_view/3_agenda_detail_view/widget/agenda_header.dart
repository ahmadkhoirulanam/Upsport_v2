// ignore_for_file: use_key_in_widget_constructors

import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:flutter/material.dart';

class AgendaHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getW(context, 0.3),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding(), vertical: getW(context, 0.02)),
      decoration: BoxDecoration(
          color: Warna().accentColor(),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(getW(context, 0.05)),
              bottomRight: Radius.circular(getW(context, 0.05)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            txt: "Agenda",
            bold: true,
            botpad: 0.02,
            size: 0.06,
            color: Colors.white,
          ),
          CustomButton(
            onPress: () {},
            height: 0.06,
            width: 0.08,
            botMargin: 0.02,
            prefixIcon: Icons.more_vert_rounded,
          )
        ],
      ),
    );
  }
}
