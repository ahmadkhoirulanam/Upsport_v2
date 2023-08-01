// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names
import 'dart:async';

import 'package:sport/controller/a_initial_controller.dart';
import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/view/0_global/1_value/clipper_value.dart';
import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:sport/view/0_global/2_widget/shadow_clippath.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:flutter/material.dart';
import 'package:sport/controller/1_splash_controller/function.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/1_value/string_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late Animation<double> tween;
  late AnimationController anim;

  init() async {
    GlobalTweenAnimation.oneToZeroTween(context, this,
        customDuration: const Duration(milliseconds: 500),
        setValue: (tweenRes, animRes) {
      tween = tweenRes;
      anim = animRes;
    }, timerFunc: () {
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          anim.forward();
        });
        FunctionSplash.pageSwitching(context);
      });
    });
  }

  initialLoader() => InitialController.load();

  @override
  void initState() {
    initialLoader();
    init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Warna().backgroundColor(),
      body: AnimatedBuilder(
          animation: anim,
          builder: (context, widget) {
            return Stack(
              children: [
                SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: tweenGetH(context,
                            tween: tween, percent: 1, invert: false),
                        color: Warna().accentColor(),
                      ),
                      Transform.translate(
                        offset: Offset(0, -getW(context, 0.2)),
                        child: SizedBox(
                          height: getW(context, 1.2),
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
                      )
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: WidgetTween(
                        y: -tweenGetH(context,
                            tween: tween, percent: 0.8, invert: true),
                        opacity: tween.value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: getW(context, 0.3),
                              child: ImgLoader.logoApp,
                            ),
                            CustomText(
                              txt: StrGlobal().namaApp,
                              size: 0.09,
                              bold: true,
                              toppad: 0.02,
                              color: Colors.white,
                            ),
                            CustomText(
                              txt: "Aplikasi Olahraga Terbaik",
                              semibold: true,
                              size: 0.036,
                              color: Colors.white,
                            ),
                          ],
                        ))),
              ],
            );
          }),
    );
  }
}
