import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_bottom_dialog.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport/controller/6_main_controller/2_chat_controlller/func_chatsview.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

SertikatCard({@required AnimationController? anim}) {
  return StatefulBuilder(builder: (context, minSetState) {
    return GestureDetector(
      onTap: () {
        FuncChatsView.chatCardClick(context, anim: anim);
      },
      child: CustomCard(
          styleId: 2,
          height: 0.57,
          width: 0.45,
          rightmargin: 0.005,
          bottommargin: 0.03,
          allpadding: 0,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: getW(context, 0.3),
                      width: getW(context, 1),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: getW(context, 0.3),
                            width: getW(context, 1),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(getW(context, 0.02)),
                              child: (ImgLoader.fitur1),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 6),
                    child: CustomText(
                      txt: "Lapangan Futsal Upgris",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      semibold: true,
                      fontId: 2,
                      leftpad: 0.02,
                      rightpad: 0.02,
                    ),
                  ),
                  CustomText(
                    txt: "5",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    color: Warna().accentColor(),
                    semibold: true,
                    prefixIcon: Icons.star,
                    iconColor: Warna().accentColor(),
                    fontId: 2,
                    leftpad: 0.02,
                    rightpad: 0.02,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomButton(
                            styleId: 2,
                            width: 0.1,
                            height: 0.1,
                            onPress: () {},
                            prefixIcon: Icons.shower,
                          ),
                          CustomButton(
                            styleId: 2,
                            width: 0.1,
                            height: 0.1,
                            onPress: () {},
                            prefixIcon: Icons.calendar_month_outlined,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: getW(context, 0.02)),
                          child: CustomButton(
                            styleId: 2,
                            onPress: () =>
                                CustomBottomDialog(txt: "On Prosess"),
                            colorAccent: Warna().accentColor(),
                            colorText: Warna().backgroundColor(),
                            text: "Rute",
                            height: 0.06,
                            width: 0.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  });
}
