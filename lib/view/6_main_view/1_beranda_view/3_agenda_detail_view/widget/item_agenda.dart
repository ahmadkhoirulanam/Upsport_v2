import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:flutter/material.dart';

class ItemAgenda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getW(context, 0.08)),
      child: Row(
        children: [
          SizedBox(
            width: getW(context, 0.14),
            height: getW(context, 0.14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  txt: "2 Jan",
                  semibold: true,
                  fontId: 1,
                ),
                CustomText(
                  txt: "2022",
                  semibold: true,
                  fontId: 1,
                ),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: getW(context, 0.07),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                height: getW(context, 0.12),
                width: getW(context, 0.12),
                child: ImgLoader.example4,
              ),
            ),
          ),
          spacingW(context, 0.03),
          SizedBox(
            height: getW(context, 0.14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  txt: "Acara Makan makan",
                  bold: true,
                  fontId: 1,
                ),
                CustomText(
                  txt: "Di kampung laut",
                  color: Colors.grey.shade300,
                  fontId: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
