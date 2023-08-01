import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport/controller/6_main_controller/2_chat_controlller/func_chatsview.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

RiwayatMateriList({@required AnimationController? anim}) {
  return StatefulBuilder(builder: (context, minSetState) {
    return GestureDetector(
      onTap: () {
        // FuncChatsView.chatCardClick(context, anim: anim);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: getW(context, 0.025)),
        padding: EdgeInsets.symmetric(horizontal: getW(context, 0.04)),
        height: getW(context, 0.4),
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
                    CustomText(
                      txt: "Programmer Semarang",
                      bold: true,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: getW(context, 0.02)),
                    child: CustomButton(
                      styleId: 2,
                      colorAccent: Warna().accentColor(),
                      colorText: Warna().backgroundColor(),
                      text: "Selesai",
                      height: 0.06,
                      width: 0.2,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Warna().accentColor(),
              thickness: getW(context, 0.002),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: getW(context, 0.06),
                    backgroundColor: Warna().accentColor(),
                    child: Center(
                      child: CircleAvatar(
                        radius: getW(context, 0.6),
                        backgroundColor: Colors.white70,
                        child: Icon(
                          Icons.groups_rounded,
                          size: getW(context, 0.07),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  spacingW(context, 0.02),
                  CustomText(
                    txt: "Pelatihan Coding Dasar",
                    bold: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    txt: "12 Agustus 2022",
                    maxLines: 2,
                    size: 0.025,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                        padding: EdgeInsets.only(right: getW(context, 0.02)),
                        child: Container(
                          width: getW(context, 0.2),
                          height: getW(context, 0.07),
                          decoration: BoxDecoration(
                            color: Warna().accentColor(),
                            borderRadius:
                                BorderRadius.circular(getW(context, 0.01)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextButton(
                                textAlign: TextAlign.center,
                                txt: "Beri Ulasan",
                                bold: true,
                                fontId: 1,
                                size: 0.03,
                                color: Warna().backgroundColor(),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  });
}
