// ignore_for_file: use_key_in_widget_constructors

import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

class ContentPageIntro extends StatelessWidget {
  final Animation<double>? tween;
  final Animation<double>? tweenHeader;
  final Widget? contentImage;
  final String? contentText;
  const ContentPageIntro(
      {@required this.tween,
      @required this.tweenHeader,
      @required this.contentImage,
      @required this.contentText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Transform.translate(
              offset: Offset(
                  0,
                  getW(context, 0.2) +
                      -tweenGetW(context,
                          tween: tween, percent: 0.5, invert: true) -
                      tweenGetW(context,
                          tween: tweenHeader, percent: 0.9, invert: true)),
              child: FadeTransition(
                opacity: tween!,
                child: SizedBox(
                  height: getW(context, 0.45),
                  child: contentImage!,
                ),
              )),
        ),
        WidgetTween(
          opacity: tweenHeader!.value,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(top: getW(context, 0.3)),
                alignment: Alignment.bottomCenter,
                height: getW(context, 0.6),
                padding: EdgeInsets.only(bottom: getW(context, 0.13)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding()),
                  child: CustomText(size: 0.04, fontId: 2, txt: contentText!),
                )),
          ),
        ),
      ],
    );
  }
}
