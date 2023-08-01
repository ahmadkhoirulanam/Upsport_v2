import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_textfield.dart';

Widget mainHeaderHome(BuildContext context, {@required double? tweenValue}) {
  return Align(
    alignment: Alignment.topCenter,
    child: WidgetTween(
      y: tweenValue! * -getW(context, 0.35),
      opacity: 1.0 - tweenValue,
      child: Container(
        height: getW(context, 0.35),
        padding: EdgeInsets.symmetric(horizontal: getW(context, 0.06)),
        decoration: BoxDecoration(color: Warna().backgroundColor()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  txt: "Welcome, Ibnu!",
                  fontId: 2,
                  size: 0.055,
                  bold: true,
                ),
                CircleAvatar(
                  radius: getW(context, 0.06),
                  backgroundColor: Warna().accentTransparentColor(),
                  child: ImgLoader.examplePhoto1mini,
                )
              ],
            ),
            spacingH(context, 0.02),
            CustomTextField(
              styleId: 2,
              height: 0.09,
              hint2: "Cari Lapangan, Pelatih, dll",
              prefixIcon: Icons.search,
            )
          ],
        ),
      ),
    ),
  );
}
