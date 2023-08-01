import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

Widget eWalletCard(BuildContext context) {
  return Container(
    height: getW(context, 0.2),
    margin: EdgeInsets.symmetric(
        horizontal: defaultPadding(), vertical: getW(context, 0.02)),
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: defaultBorderRadius(context),
        border: Border.all(
            width: getW(context, 0.004), color: Warna().eWalletAccentColor())),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: getW(context, 0.03)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                txt: "Poin Anda",
                color: Warna().eWalletAccentColor(),
              ),
              CustomText(
                txt: "907 Poin",
                semibold: true,
                size: 0.04,
                fontId: 1,
              )
            ],
          ),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              onPress: () {},
              text: "Dompetku",
              styleId: 6,
              iconSize: 0.07,
              width: 0.17,
              colorText: Warna().eWalletAccentColor(),
              colorIcon: Warna().eWalletAccentColor(),
              verticalAlign: true,
              prefixIcon: Icons.wallet,
            ),
          ],
        ))
      ],
    ),
  );
}
