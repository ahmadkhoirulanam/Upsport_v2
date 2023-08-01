import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:flutter/material.dart';

class OrganisasiDiikuti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          txt: "Organisasi Yang Diikuti",
          semibold: true,
          size: 0.035,
          toppad: 0.03,
          botpad: 0.02,
        ),
        SizedBox(
            height: getW(context, 0.3),
            child: ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: getW(context, 0.85),
                    height: getW(context, 0.3),
                    margin: EdgeInsets.only(
                      left: index != 0 ? getW(context, 0.02) : 0,
                    ),
                    decoration: BoxDecoration(
                        color: Warna().accentColor70(),
                        borderRadius:
                            BorderRadius.circular(getW(context, 0.05))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: getW(context, 0.07),
                          backgroundColor: Colors.white12,
                          child: Icon(
                            Icons.groups_outlined,
                            color: Colors.white,
                            size: getW(context, 0.08),
                          ),
                        ),
                        CustomText(
                          txt: "Programmer Semarang",
                          textAlign: TextAlign.center,
                          semibold: true,
                          size: 0.03,
                          color: Colors.white,
                        )
                      ],
                    ),
                  );
                }))
      ],
    );
  }
}
