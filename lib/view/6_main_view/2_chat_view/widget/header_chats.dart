import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

Widget mainHeaderChats(BuildContext context, {@required double? tweenValue}) {
  pinnedChat() {
    return CustomButton(
      styleId: 4,
      onPress: () {},
      rightMargin: 0.02,
      height: 0.15,
      width: 0.15,
      horMargin: 0.01,
      prefixIcon: Icons.person_outline,
    );
  }

  return Align(
    alignment: Alignment.topCenter,
    child: WidgetTween(
      y: tweenValue! * -getW(context, 0.52),
      opacity: 1.0 - tweenValue,
      child: Container(
        height: getW(context, 0.25),
        color: Warna().backgroundColor(),
        padding: EdgeInsets.only(top: getW(context, 0.02)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getW(context, 0.06)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        txt: "Chats",
                        fontId: 2,
                        size: 0.055,
                        bold: true,
                      ),
                      CustomButton(
                        styleId: 2,
                        width: 0.1,
                        height: 0.1,
                        onPress: () {},
                        prefixIcon: Icons.search,
                      ),
                    ],
                  ),
                  spacingH(context, 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
