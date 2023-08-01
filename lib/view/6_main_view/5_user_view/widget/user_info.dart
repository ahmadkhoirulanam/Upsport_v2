import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: getW(context, 0.15),
              backgroundColor: Warna().backgroundColor(),
              child: Padding(
                padding: EdgeInsets.all(getW(context, 0.01)),
                child: ImgLoader.examplePhoto1mini,
              ),
            ),
            // CustomButton(
            //   onPress: () {},
            //   height: 0.07,
            //   botMargin: 0.03,
            //   borderRadius: 0.03,
            //   text: "Edit Profil",
            // )
          ],
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.person,
                color: Warna().accentTransparentColor(aplha: 10),
                size: getW(context, 0.3),
              ),
            ),
            Column(
              children: [
                CustomText(
                  align: Alignment.centerLeft,
                  txt: "Stephen William",
                  semibold: true,
                  size: 0.05,
                  toppad: 0.04,
                ),
                CustomText(
                  txt: "stephenwilliam@gmail.com",
                  prefixIcon: Icons.email_outlined,
                  iconSpacing: 0.06,
                  color: Warna().accentColor(),
                  iconColor: Warna().accentColor(),
                ),
                CustomText(
                  txt: "Pedurungan, Semarang",
                  prefixIcon: Icons.location_on_outlined,
                  iconSpacing: 0.06,
                  color: Warna().accentColor(),
                  iconColor: Warna().accentColor(),
                ),
                CustomText(
                  txt: "14 November 1998",
                  prefixIcon: Icons.date_range_outlined,
                  iconSpacing: 0.06,
                  color: Warna().accentColor(),
                  iconColor: Warna().accentColor(),
                ),
                Divider(
                  thickness: getW(context, 0.01),
                  color: Warna().accentTransparentColor(aplha: 15),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
