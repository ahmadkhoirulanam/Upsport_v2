import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport/controller/6_main_controller/2_chat_controlller/func_chatsview.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

PembayaranList({@required AnimationController? anim}) {
  return StatefulBuilder(builder: (context, minSetState) {
    return GestureDetector(
      onTap: () {
        // FuncChatsView.chatCardClick(context, anim: anim);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: getW(context, 0.025)),
        padding: EdgeInsets.symmetric(horizontal: getW(context, 0.04)),
        height: getW(context, 0.15),
        decoration: BoxDecoration(
            color: Warna().buttonColor1Background(),
            borderRadius: BorderRadius.circular(getW(context, 0.03))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: getW(context, 0.05),
                      backgroundColor: Warna().backgroundColor(),
                      child: Center(
                        child: CircleAvatar(
                          radius: getW(context, 0.05),
                          backgroundColor: Colors.white70,
                          child: Icon(Icons.groups_rounded,
                              size: getW(context, 0.06),
                              color: Warna().accentColor()),
                        ),
                      ),
                    ),
                    spacingW(context, 0.02),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              txt: "GoPay",
                              bold: true,
                            ),
                            // CustomText(
                            //   leftpad: 0.,
                            //   txt: "GoPay",
                            //   bold: true,
                            // ),
                          ],
                        ),
                        CustomText(
                          txt: "Saldo: Rp 0",
                          color: Warna().accentColor70(),
                        ),
                      ],
                    ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Padding(
                    //     padding:
                    //         EdgeInsets.only(right: getW(context, 0.02)),
                    //     child: CustomButton(
                    //       styleId: 2,
                    //       colorAccent: Warna().accentColor(),
                    //       colorText: Warna().backgroundColor(),
                    //       text: "Utama",
                    //       height: 0.04,
                    //       topMargin: 0.02,
                    //       width: 0.2,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                CustomButton(
                  styleId: 2,
                  onPress: () {},
                  topMargin: 0.01,
                  rightMargin: 0.01,
                  leftMargin: 0.02,
                  height: 0.07,
                  suffixIcon: Icons.arrow_forward_ios,
                  colorIcon: Warna().accentColor70(),
                  width: 0.07,
                ),

                // Align(
                //   alignment: Alignment.topRight,
                //   child: Padding(
                //     padding: EdgeInsets.only(right: getW(context, 0.02)),
                //     child: CustomButton(
                //       styleId: 2,
                //       colorAccent: Warna().accentColor(),
                //       colorText: Warna().backgroundColor(),
                //       text: "Utama",
                //       height: 0.06,
                //       topMargin: 0.02,
                //       width: 0.2,
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  });
}
