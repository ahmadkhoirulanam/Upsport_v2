import 'package:flutter/material.dart';

class GlobalTweenAnimation {
  static void zeroToOneTween(
      BuildContext context,
      TickerProvider ticker,
      {@required
          Function(
        Animation<double> tween,
        AnimationController anim,
      )?
              setValue,
      Duration? customDuration,
      Curve? customCurve,
      VoidCallback? timerFunc}) {
    AnimationController animRes = AnimationController(
        value: 0.0,
        vsync: ticker,
        duration: customDuration ?? const Duration(milliseconds: 250));
    Animation<double> tweenRes = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animRes, curve: customCurve ?? Curves.fastOutSlowIn));

    setValue!(tweenRes, animRes);
    timerFunc!();
  }

  static void oneToZeroTween(
      BuildContext context,
      TickerProvider ticker,
      {@required
          Function(
        Animation<double> tween,
        AnimationController anim,
      )?
              setValue,
      Duration? customDuration,
      Curve? customCurve,
      VoidCallback? timerFunc}) {
    AnimationController animRes = AnimationController(
        value: 0.0,
        vsync: ticker,
        duration: customDuration ?? const Duration(milliseconds: 250));
    Animation<double> tweenRes = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animRes, curve: customCurve ?? Curves.fastOutSlowIn));

    setValue!(tweenRes, animRes);
    if (timerFunc != null) timerFunc();
  }
}
