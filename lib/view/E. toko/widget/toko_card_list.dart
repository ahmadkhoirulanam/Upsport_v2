import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport/controller/6_main_controller/2_chat_controlller/func_chatsview.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/image_loader.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

ListToko({@required AnimationController? anim}) {
  return StatefulBuilder(builder: (context, minSetState) {
    return GestureDetector(
      onTap: () {
        // FuncChatsView.chatCardClick(context, anim: anim);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: getW(context, 0.025)),
        padding: EdgeInsets.symmetric(horizontal: getW(context, 0.04)),
        height: getW(context, 0.25),
        decoration: BoxDecoration(
            color: Warna().buttonColor2Background(),
            borderRadius: BorderRadius.circular(getW(context, 0.03))),
        child: Row(
          children: [
            CircleAvatar(
              radius: getW(context, 0.07),
              backgroundColor: Warna().accentColor(),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Warna().accentTransparentColor(aplha: 50),
                  radius: getW(context, 0.07),
                  child: ImgLoader.examplePhoto1mini,
                ),
              ),
            ),
            spacingW(context, 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    txt: "Joko Susilo",
                    bold: true,
                  ),
                  CustomText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      size: 0.028,
                      txt: "Massage Terbaik"),
                  Row(
                    children: [
                      Icon(
                        Icons.sports_score_sharp,
                        size: getH(context, 0.02),
                        color: Warna().accentColorCerah(),
                      ),
                      spacingW(context, 0.02),
                      Icon(
                        Icons.sports_gymnastics_rounded,
                        size: getH(context, 0.02),
                        color: Warna().accentColorCerah(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: getH(context, 0.025),
                        color: Warna().accentColorCerah(),
                      ),
                      spacingW(context, 0.02),
                      CustomText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          size: 0.028,
                          txt: "Rute"),
                    ],
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
