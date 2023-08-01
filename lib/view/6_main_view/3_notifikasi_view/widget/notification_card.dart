import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

notificationCard({@required bool? markUnread}) {
  bool? initMarkUnread = markUnread ?? false;
  return StatefulBuilder(builder: (context, minSetState) {
    return SizedBox(
      height: getW(context, 0.225),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: getW(context, 0.025)),
            padding: EdgeInsets.symmetric(horizontal: getW(context, 0.04)),
            height: getW(context, 0.2),
            decoration: BoxDecoration(
                color: initMarkUnread
                    ? Colors.transparent
                    : Warna().buttonColor2Background(),
                border: Border.all(
                    width: getW(context, 0.007),
                    color: initMarkUnread
                        ? Warna().buttonColor2Background()
                        : Colors.transparent),
                borderRadius: BorderRadius.circular(getW(context, 0.03))),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        txt: "Nama Notif",
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
                CustomText(
                  toppad: 0.03,
                  align: Alignment.topRight,
                  txt: "10.10",
                  size: 0.03,
                ),
              ],
            ),
          ),
          if (initMarkUnread)
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: getW(context, 0.012),
              ),
            )
        ],
      ),
    );
  });
}
