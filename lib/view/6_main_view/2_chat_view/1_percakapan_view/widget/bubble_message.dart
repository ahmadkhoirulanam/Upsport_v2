// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

BubbleMessagePercakapan(BuildContext context,
    {@required Animation<double>? containerTween,
    @required bool? fromMe,
    @required String? text}) {
  return Transform.translate(
    offset: Offset(
        fromMe!
            ? getW(context, containerTween!.value)
            : -getW(context, containerTween!.value),
        0),
    child: Align(
      alignment: fromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            fromMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: getW(context, 0.002),
              left: getW(context, fromMe ? 0.2 : 0.05),
              right: getW(context, fromMe ? 0.05 : 0.2),
            ),
            padding: EdgeInsets.all(getW(context, 0.03)),
            constraints: BoxConstraints(
              minHeight: getW(context, 0.1),
              minWidth: getW(context, 0.2),
              maxWidth: getW(context, 0.7),
            ),
            decoration: BoxDecoration(
                color: fromMe
                    ? Warna().accentTransparentColor()
                    : Warna().accentColor70(),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getW(context, 0.04)),
                    topRight: Radius.circular(getW(context, 0.04)),
                    bottomRight:
                        Radius.circular(getW(context, fromMe ? 0.0 : 0.04)),
                    bottomLeft:
                        Radius.circular(getW(context, fromMe ? 0.04 : 0.0)))),
            child: CustomText(
              txt: text,
              color: fromMe ? Warna().fontColor1() : Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment:
                fromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (fromMe)
                CustomText(
                  txt: "Read",
                  color: Colors.blue,
                  size: 0.028,
                  botpad: 0.02,
                  rightpad: 0.02,
                ),
              CustomText(
                txt: "10.00",
                botpad: 0.02,
                size: 0.028,
                leftpad: fromMe ? 0.0 : 0.05,
                rightpad: fromMe ? 0.05 : 0.0,
              ),
            ],
          )
        ],
      ),
    ),
  );
}
