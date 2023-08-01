import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

mainHeaderorganisasi(BuildContext context, {@required double? tweenValue}) {
  return Align(
    alignment: Alignment.topCenter,
    child: WidgetTween(
      y: tweenValue! * -getW(context, 0.25),
      opacity: 1.0 - tweenValue,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: getW(context, 0.25),
        padding: EdgeInsets.symmetric(
            horizontal: getW(context, 0.06), vertical: getW(context, 0.03)),
        color: Warna().backgroundColor(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomButton(
              styleId: 2,
              width: 0.08,
              height: 0.1,
              onPress: () {
                Navigator.pop(context);
              },
              prefixIcon: Icons.arrow_back_ios_new,
            ),
            CustomText(
              txt: "Pelatih Futsal",
              fontId: 2,
              size: 0.055,
              bold: true,
            ),
          ],
        ),
      ),
    ),
  );
}
