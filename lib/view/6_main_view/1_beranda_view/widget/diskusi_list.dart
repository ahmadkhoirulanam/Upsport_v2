import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

diskusiList(BuildContext context) {
  button() {
    return CustomButton(
      onPress: () {},
      styleId: 5,
      text: "Grup",
      horPadding: 0.02,
      customBody: Row(
        children: [
          CircleAvatar(
            backgroundColor: Warna().accentColor(),
            radius: getW(context, 0.06),
            child: Icon(Icons.group, color: Colors.white),
          ),
          spacingW(context, 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                txt: "Grup",
                semibold: true,
                size: 0.036,
              ),
              CustomText(
                txt: "Chat Terakhir",
                size: 0.03,
              )
            ],
          ),
        ],
      ),
    );
  }

  return Padding(
      padding: EdgeInsets.only(top: getW(context, 0.04)),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    txt: "Discussion",
                    align: Alignment.centerLeft,
                    bold: true,
                    size: 0.05,
                    botpad: 0.02,
                  ),
                  CustomButton(
                    onPress: () {},
                    styleId: 2,
                    alignRight: true,
                    text: "",
                    width: 0.1,
                    iconSize: 0.06,
                    prefixIcon: Icons.arrow_forward_outlined,
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultPadding()),
            padding: EdgeInsets.only(top: getW(context, 0.04)),
            constraints: BoxConstraints(minHeight: getW(context, 0.25)),
            decoration: BoxDecoration(
                borderRadius: defaultBorderRadius(context),
                color: Warna().buttonColor1Background()),
            child: Column(
              children: [button(), button(), button()],
            ),
          ),
        ],
      ));
}
