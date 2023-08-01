import 'package:flutter/material.dart';
import 'package:sport/controller/6_main_controller/1_beranda_controller/func_homeview.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_card.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';

eventListHome(BuildContext context, {@required AnimationController? anim}) {
  return Padding(
      padding: EdgeInsets.only(top: getW(context, 0.04)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding()),
            child: CustomText(
              txt: "FItur UpSport",
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
                _eventCardHome(context,
                    cardIndex: 1, image: ImgLoader.fitur1, anim: anim),
                _eventCardHome(context,
                    cardIndex: 2, image: ImgLoader.fitur1, anim: anim),
                _eventCardHome(context,
                    cardIndex: 3, image: ImgLoader.fitur1, anim: anim)
              ],
            ),
          ),
        ],
      ));
}

_eventCardHome(
  BuildContext context, {
  @required int? cardIndex,
  @required AnimationController? anim,
  String? judul,
  String? ringkasan,
  @required Widget? image,
}) {
  String imgHeroTag = "eventCard$cardIndex";
  return GestureDetector(
    onTap: () {
      anim!.reverse();
      FuncHomeView.eventClick(
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
                                styleId: 2,
                                onPress: () {},
                                colorAccent: Colors.white70,
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
                  txt: "GOR UPGRIS Kampus 4",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  semibold: true,
                  fontId: 2,
                  leftpad: 0.02,
                  rightpad: 0.02,
                ),
                CustomText(
                  txt:
                      "GOR UPGRIS atau kampus 4 Universitas PGRI Semarang ini diresmikan oleh Menteri Riset Teknologi dan Pendidikan Tinggi Prof. H. Mohamad Nasir, Ph.D.Ak. Sabtu 23 Janurai 2016 jam 13.30 wib bertempat Jalan Gajah Raya Semarang. ",
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
                      txt: "12",
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
