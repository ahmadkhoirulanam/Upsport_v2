// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget WidgetTween(
    {double? x,
    double? y,
    @required Widget? child,
    Animation<double>? tween,
    AnimationController? anim,
    double? opacity,
    bool? invertTweenOpacity}) {
  return Builder(builder: (context) {
    bool initInvertTweenOpacity = invertTweenOpacity ?? false;
    return anim != null
        ? AnimatedBuilder(
            animation: anim,
            builder: (context, minWidget) {
              return Transform.translate(
                offset: Offset(tween!.value * (x ?? 0), tween.value * (y ?? 0)),
                child: Opacity(
                    opacity: initInvertTweenOpacity
                        ? tween.value
                        : 1.0 - tween.value,
                    child: child!),
              );
            })
        : Transform.translate(
            offset: Offset(x ?? 0, y ?? 0),
            child: Opacity(opacity: opacity ?? 1.0, child: child!),
          );
  });
}
