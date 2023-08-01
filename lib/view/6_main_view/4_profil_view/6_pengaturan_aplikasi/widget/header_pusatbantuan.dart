import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_textfield.dart';
import 'package:sport/view/6_main_view/4_profil_view/3_riwayat_materi_view/widget/custom_static_dropdown.dart';
import 'package:sport/view/6_main_view/4_profil_view/3_riwayat_materi_view/widget/specialistFilter.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

Widget mainHeaderPengaturanApp(BuildContext context,
    {@required double? tweenValue}) {
  return Align(
    alignment: Alignment.topCenter,
    child: WidgetTween(
      y: tweenValue! * -getW(context, 0.4),
      opacity: 1.0 - tweenValue,
      child: Container(
        height: getW(context, 0.2),
        color: Warna().backgroundColor(),
        padding: EdgeInsets.only(top: getW(context, 0.02)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getW(context, 0.05)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                        styleId: 2,
                        width: 0.1,
                        height: 0.1,
                        onPress: () {
                          Navigator.pop(context);
                        },
                        prefixIcon: Icons.arrow_back_ios,
                      ),
                      CustomText(
                        txt: "Pusat Bantuan",
                        fontId: 2,
                        size: 0.055,
                        bold: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
