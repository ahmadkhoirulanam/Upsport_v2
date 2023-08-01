// ignore_for_file: use_key_in_widget_constructors

import 'package:sport/view/0_global/1_value/string_value.dart';
import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/clipper_value.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/2_widget/shadow_clippath.dart';

class BlumbHeaderLogin extends StatelessWidget {
  final Animation<double>? tween;
  final bool? fromSplash;
  const BlumbHeaderLogin({@required this.tween, @required this.fromSplash});

  @override
  Widget build(BuildContext context) {
    bool? initFromSplash = fromSplash ?? false;
    double tweenFromSplash = -getW(context, 0.1) +
        -tweenGetW(context, tween: tween, percent: 1.2, invert: true);
    double tweenFromIntro =
        -tweenGetW(context, tween: tween, percent: 0.1, invert: false);
    return Transform.translate(
      offset: Offset(0, -getW(context, 0.2)),
      child: SizedBox(
        height: getW(context, 1.2),
        child: Stack(
          children: [
            WidgetTween(
              x: 0,
              y: initFromSplash ? tweenFromSplash : tweenFromIntro,
              child: ClipShadowPath(
                clipper: HeaderClipper(),
                shadow: Shadow(
                    blurRadius: getW(context, 0.02),
                    color: Colors.black26,
                    offset: Offset(0, getW(context, 0.035))),
                child: Container(
                  color: Warna().accentColor(),
                ),
              ),
            ),
            WidgetTween(
              x: 0,
              y: initFromSplash ? tweenFromSplash + getW(context, 0.1) : 0,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getW(context, 0.2),
                    child: ImgLoader.logoApp,
                  ),
                  CustomText(
                    txt: StrGlobal().namaApp,
                    size: 0.06,
                    bold: true,
                    toppad: 0.02,
                    color: Colors.white,
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
