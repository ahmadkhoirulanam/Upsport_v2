// ignore_for_file: use_key_in_widget_constructors

import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/clipper_value.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/2_widget/shadow_clippath.dart';

class BlumbHeaderIntro extends StatelessWidget {
  final Animation<double>? tween;
  const BlumbHeaderIntro({@required this.tween});
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -getW(context, 0.2)),
      child: SizedBox(
        height: getW(context, 1.2),
        child: Stack(
          children: [
            WidgetTween(
              x: 0,
              // y: -tweenGetW(context, tween: tween, percent: 1.2, invert: true),
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
            )
          ],
        ),
      ),
    );
  }
}
