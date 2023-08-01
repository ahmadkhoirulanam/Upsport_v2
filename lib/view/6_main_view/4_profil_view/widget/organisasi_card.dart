// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_textbutton.dart';
import 'package:sport/view/B.%20Pelatih/widget/pelatihfutsal.dart';
import 'package:flutter/material.dart';

class OrganisasiCard extends StatelessWidget {
  final bool? tombolTambah;
  final int? index;
  OrganisasiCard({this.tombolTambah, this.index});
  @override
  Widget build(BuildContext context) {
    bool initTombolTambah = tombolTambah ?? false;
    int initIndex = index ?? 0;
    return initTombolTambah
        ? Container(
            width: getW(context, 0.2),
            height: getW(context, 0.35),
            margin: EdgeInsets.only(
                left: initIndex > 0 ? getW(context, 0.04) : defaultPadding()),
            decoration: BoxDecoration(
                color: Warna().buttonColor1Background(),
                borderRadius: BorderRadius.circular(getW(context, 0.06)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: getW(context, 0.005),
                    spreadRadius: getW(context, 0.005),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Warna().buttonColor1Foreground(),
                  size: getW(context, 0.15),
                ),
                CustomTextButton(
                  textAlign: TextAlign.center,
                  txt: "TAMBAH ORGANISASI",
                  bold: true,
                  fontId: 1,
                  size: 0.03,
                  color: Warna().buttonColor1Foreground(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PelatihFutsal()),
                    );
                  },
                ),
              ],
            ),
          )
        : Container(
            width: getW(context, 0.5),
            height: getW(context, 0.35),
            margin: EdgeInsets.only(left: defaultPadding()),
            decoration: BoxDecoration(
                color: Warna().accentColorCerah(),
                borderRadius: BorderRadius.circular(getW(context, 0.06)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: getW(context, 0.005),
                    spreadRadius: getW(context, 0.005),
                  )
                ]),
            child: Stack(
              children: [
                WidgetTween(
                  y: getW(context, -0.03),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: getW(context, 0.07),
                          backgroundColor: Colors.white30,
                          child: Icon(
                            Icons.groups_rounded,
                            size: getW(context, 0.1),
                            color: Colors.white,
                          ),
                        ),
                        CustomText(
                          txt: "Programmer Semarang",
                          width: 0.3,
                          leftpad: 0.02,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                          size: 0.04,
                        )
                      ],
                    ),
                  ),
                ),
                CustomText(
                  align: Alignment.bottomLeft,
                  txt: "Sebagai Anggota",
                  leftpad: 0.03,
                  botpad: 0.03,
                  size: 0.03,
                  semibold: true,
                  color: Colors.white,
                )
              ],
            ),
          );
  }
}
