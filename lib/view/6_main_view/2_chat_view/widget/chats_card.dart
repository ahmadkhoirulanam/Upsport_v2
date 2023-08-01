import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport/controller/6_main_controller/2_chat_controlller/func_chatsview.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

chatsCard({@required AnimationController? anim}) {
  return StatefulBuilder(builder: (context, minSetState) {
    return GestureDetector(
      onTap: () {
        FuncChatsView.chatCardClick(context, anim: anim);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: getW(context, 0.025)),
        padding: EdgeInsets.symmetric(horizontal: getW(context, 0.04)),
        height: getW(context, 0.2),
        decoration: BoxDecoration(
            color: Warna().buttonColor2Background(),
            borderRadius: BorderRadius.circular(getW(context, 0.03))),
        child: Row(
          children: [
            CircleAvatar(
              radius: getW(context, 0.07),
              backgroundColor: Warna().accentColor(),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: getW(context, 0.05),
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
                    txt: "Nama User",
                    bold: true,
                  ),
                  CustomText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      size: 0.028,
                      txt:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam")
                ],
              ),
            ),
            spacingW(context, 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  txt: "10.10",
                  size: 0.03,
                ),
                CircleAvatar(
                  radius: getW(context, 0.02),
                  backgroundColor: Warna().accentColor(),
                  child: CustomText(
                    txt: "1",
                    size: 0.02,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  });
}
