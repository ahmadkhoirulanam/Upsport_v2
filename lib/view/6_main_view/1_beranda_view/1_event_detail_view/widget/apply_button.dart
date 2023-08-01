// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

Widget ApplyButtonEvent(BuildContext context) {
  return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          width: getW(context, 0.85),
          height: getW(context, 0.15),
          margin: EdgeInsets.only(bottom: getW(context, 0.07)),
          padding: EdgeInsets.symmetric(horizontal: getW(context, 0.07)),
          decoration: BoxDecoration(
              color: Warna().accentColor(),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: getW(context, 0.01),
                    offset: Offset(0, getW(context, 0.02)))
              ],
              borderRadius: BorderRadius.circular(getW(context, 1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                align: Alignment.centerLeft,
                txt: "Pesan",
                fontId: 2,
                semibold: true,
                color: Colors.white,
                size: 0.05,
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: getW(context, 0.08),
                color: Colors.white,
              )
            ],
          )));
}
