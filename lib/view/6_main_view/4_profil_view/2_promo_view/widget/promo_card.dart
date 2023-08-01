import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:sport/controller/6_main_controller/2_chat_controlller/func_chatsview.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

PromoCard({@required AnimationController? anim}) {
  return StatefulBuilder(builder: (context, minSetState) {
    return GestureDetector(
      onTap: () {
        FuncChatsView.chatCardClick(context, anim: anim);
      },
      child: CustomCard(
          styleId: 2,
          height: 0.57,
          width: 0.45,
          rightmargin: 0.02,
          bottommargin: 0.03,
          allpadding: 0,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(getW(context, 0.01)),
                    child: SizedBox(
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
                                child: (ImgLoader.example7),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 6),
                    child: CustomText(
                      txt: "Promo 12.12. Diskon 100% s/d 35rb",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      semibold: true,
                      fontId: 2,
                      leftpad: 0.02,
                      rightpad: 0.02,
                    ),
                  ),
                  CustomText(
                    txt: "Berlaku Sampai 12 Agustus 2022",
                    maxLines: 2,
                    leftpad: 0.02,
                    rightpad: 0.02,
                    size: 0.025,
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
                            prefixIcon: Icons.share,
                          ),
                          CustomButton(
                            styleId: 2,
                            width: 0.1,
                            height: 0.1,
                            onPress: () {},
                            prefixIcon: Icons.copy,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: getW(context, 0.02)),
                          child: GestureDetector(
                            onTap: () {},
                            child: CustomButton(
                              styleId: 2,
                              colorAccent: Warna().accentColor(),
                              colorText: Warna().backgroundColor(),
                              text: "Gunakan",
                              height: 0.06,
                              width: 0.2,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  });
}
