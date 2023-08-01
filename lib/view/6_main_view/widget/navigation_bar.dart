import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';

Widget mainNavigationBar(BuildContext context,
    {@required Function(int index)? onPageChanges,
    @required Animation<double>? navbarTween,
    VoidCallback? onClick,
    @required int? currentIndex}) {
  return StatefulBuilder(builder: (context, setState) {
    button(
        {@required IconData? icon,
        @required int? buttonIndex,
        double? chatIconSize}) {
      return CustomButton(
          onPress: () {
            if (onClick != null) onClick();
            setState(() {
              currentIndex = buttonIndex;
            });
            onPageChanges!(currentIndex!);
          },
          width: 0.15,
          height: 0.15,
          customBody: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Icon(
                  icon!,
                  color: Colors.white,
                  size: getW(context, chatIconSize ?? 0.07),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                  margin: EdgeInsets.only(bottom: getW(context, 0.025)),
                  decoration: BoxDecoration(
                      color: (buttonIndex == currentIndex)
                          ? Colors.yellow
                          : Warna().accentColor(),
                      borderRadius: BorderRadius.circular(getW(context, 0.05))),
                  height: getW(context, 0.007),
                  width: getW(context, 0.015),
                ),
              )
            ],
          ));
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Transform.translate(
        offset: Offset(
            0, getW(context, navbarTween != null ? navbarTween.value : 0)),
        child: Container(
          width: getW(context, 0.85),
          height: getW(context, 0.15),
          margin: EdgeInsets.only(bottom: getW(context, 0.07)),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              button(icon: Icons.home, buttonIndex: 0),
              button(icon: Icons.chat, buttonIndex: 1, chatIconSize: 0.064),
              button(icon: Icons.notifications, buttonIndex: 2),
              button(icon: Icons.person, buttonIndex: 3),
            ],
          ),
        ),
      ),
    );
  });
}
