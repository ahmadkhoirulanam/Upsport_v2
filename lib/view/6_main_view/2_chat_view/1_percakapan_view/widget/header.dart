// ignore_for_file: non_constant_identifier_names

import 'package:sport/view/0_global/2_widget/backward_button.dart';
import 'package:flutter/material.dart';
import 'package:sport/controller/6_main_controller/2_chat_controlller/func_chatsview.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

HeaderPercakapan(BuildContext context, {@required VoidCallback? onBackPress}) {
  return Container(
    height: getW(context, 0.24),
    width: getW(context, 1),
    padding: EdgeInsets.symmetric(horizontal: getW(context, 0.05)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            BackwardButton(
              blackColor: true,
              customOnPress: () {
                onBackPress!();
              },
              withoutMargin: true,
            ),
            Hero(
              tag: "profilePhoto",
              child: CircleAvatar(
                radius: getW(context, 0.06),
                backgroundColor: Warna().accentColor(),
                child: ImgLoader.examplePhoto1mini,
              ),
            ),
            spacingW(context, 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    txt: "Nama User",
                    semibold: true,
                  ),
                  CustomText(
                    txt: "Online",
                    prefixIcon: Icons.circle,
                    iconColor: Colors.green,
                    size: 0.03,
                    iconSize: 0.02,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CustomButton(
                  styleId: 2,
                  onPress: () => FuncChatsView.voiceCallClick(context,
                      photo: ImgLoader.examplePhoto1mini),
                  prefixIcon: Icons.call_outlined,
                  width: 0.08,
                ),
                CustomButton(
                  styleId: 2,
                  onPress: () {},
                  prefixIcon: Icons.videocam_outlined,
                  width: 0.08,
                ),
                CustomButton(
                  styleId: 2,
                  onPress: () {},
                  prefixIcon: Icons.more_vert,
                  width: 0.08,
                ),
              ],
            )
          ],
        ),
        Divider(
          thickness: getW(context, 0.004),
        )
      ],
    ),
  );
}
