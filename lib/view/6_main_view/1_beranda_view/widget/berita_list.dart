import 'package:flutter/material.dart';
import 'package:sport/controller/6_main_controller/1_beranda_controller/func_homeview.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_card.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';

beritaList(BuildContext context, {@required AnimationController? anim}) {
  return Padding(
      padding: EdgeInsets.only(top: getW(context, 0.04)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding()),
            child: CustomText(
              txt: "Sport News",
              align: Alignment.centerLeft,
              bold: true,
              botpad: 0.02,
              size: 0.05,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: defaultPadding()),
            child: Row(
              children: [
                _beritaCard(context,
                    cardIndex: 1, image: ImgLoader.berita1, anim: anim),
                _beritaCard(context,
                    cardIndex: 2, image: ImgLoader.berita1, anim: anim),
                _beritaCard(context,
                    cardIndex: 3, image: ImgLoader.berita1, anim: anim)
              ],
            ),
          ),
        ],
      ));
}

_beritaCard(
  BuildContext context, {
  @required int? cardIndex,
  @required AnimationController? anim,
  String? judul,
  String? ringkasan,
  @required Widget? image,
}) {
  String imgHeroTag = "newsCard$cardIndex";
  return GestureDetector(
    onTap: () {
      anim!.reverse();
      FuncHomeView.beritaClick(
        context,
        imgHeaderTag: imgHeroTag,
        imgHeader: image,
      );
    },
    child: CustomCard(
        styleId: 2,
        height: 0.52,
        width: 0.45,
        rightmargin: 0.02,
        allpadding: 0,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(getW(context, 0.01)),
                  child: SizedBox(
                      height: getW(context, 0.22),
                      width: getW(context, 0.42),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: getW(context, 0.22),
                            width: getW(context, 0.42),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(getW(context, 0.02)),
                              child: Hero(tag: imgHeroTag, child: image!),
                            ),
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: CustomButton(
                                styleId: 3,
                                colorAccent: Colors.white70,
                                onPress: () {},
                                topMargin: 0.01,
                                rightMargin: 0.01,
                                height: 0.08,
                                prefixIcon: Icons.favorite_border,
                                width: 0.08,
                              ))
                        ],
                      )),
                ),
                CustomText(
                  txt: "Berita Bola Terkini",
                  textAlign: TextAlign.left,
                  align: Alignment.centerLeft,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  semibold: true,
                  fontId: 2,
                  leftpad: 0.02,
                  rightpad: 0.02,
                ),
                CustomText(
                  txt:
                      "Chelsea akan menjamu Fulham di Stamford Bridge pada pekan ke-22 Premier League 2022/2023. Pertandingan Liga Inggris antara Chelsea vs Fulham ini akan live Sabtu, 4 Februari 2023, jam 03:00 WIB.",
                  maxLines: 2,
                  leftpad: 0.02,
                  rightpad: 0.02,
                  size: 0.025,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(getW(context, 0.02)),
                child: Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye,
                      size: getW(context, 0.04),
                      color: Warna().accentColor(),
                    ),
                    CustomText(
                      leftpad: 0.01,
                      txt: "150",
                      fontId: 2,
                    )
                  ],
                ),
              ),
            )
          ],
        )),
  );
}
