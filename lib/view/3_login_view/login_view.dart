// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/controller/d_delay_function.dart';
import 'package:sport/view/0_global/1_value/string_value.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/3_login_view/string.dart';
import 'package:flutter/material.dart';
import 'package:sport/controller/3_login_controlller/func_loginview.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_textfield.dart';
import 'package:sport/view/3_login_view/widget/blumb_header.dart';

class LoginView extends StatefulWidget {
  final bool? fromSplashView;
  final bool? fromMainView;
  const LoginView({this.fromSplashView, this.fromMainView});
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  late Animation<double> tween;
  late AnimationController anim;
  late bool initFromSplash;
  late bool initFromMain;
  ScrollController scrollController = ScrollController();
  bool loginClicked = false;

  initValue() {
    initFromSplash = widget.fromSplashView ?? false;
    initFromMain = widget.fromMainView ?? false;
    GlobalTweenAnimation.zeroToOneTween(context, this,
        setValue: (tweenRes, animRes) {
      tween = tweenRes;
      anim = animRes;
    }, timerFunc: () {
      DelayFunction.delay200msFunction(context,
          onAfterDelay: () => anim.forward());
    });
  }

  @override
  void initState() {
    initValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().backgroundColor(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: AnimatedBuilder(
            animation: anim,
            builder: (context, widget) {
              return Stack(
                children: [
                  BlumbHeaderLogin(
                    tween: tween,
                    fromSplash: initFromSplash,
                  ),
                  WidgetTween(
                    opacity: tween.value,
                    child: Container(
                        margin: EdgeInsets.only(
                            top: getW(context, 0.8),
                            bottom: getW(context, 0.1)),
                        padding: EdgeInsets.symmetric(
                            horizontal: getW(context, 0.12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(
                              align: Alignment.centerLeft,
                              txt: StrLogin().selamatDatang,
                              bold: true,
                              size: 0.06,
                              fontId: 2,
                            ),
                            spacingH(context, 0.04),
                            CustomTextField(hint: StrGlobal().email),
                            CustomTextField(
                              hint: StrGlobal().password,
                              obsecure: true,
                              suffixWidget: CustomButton(
                                  styleId: 2,
                                  width: 0.1,
                                  height: 0.08,
                                  onPress: () {},
                                  prefixIcon: Icons.remove_red_eye),
                            ),
                            CustomButton(
                              onPress: () => FuncLoginView.forgotPassword(
                                  context, scrollController),
                              botMargin: 0.04,
                              text: StrLogin().lupaPassword,
                              styleId: 2,
                              alignRight: true,
                            ),
                            Row(
                              children: [
                                CustomButton(
                                  text: StrLogin().masuk,
                                  onPress: () =>
                                      FuncLoginView.login(context, onClick: () {
                                    initFromSplash = true;
                                    anim.reverse();
                                  }),
                                  height: 0.08,
                                  rightMargin: 0.02,
                                  width: 0.64,
                                ),
                                CustomButton(
                                  onPress: () {},
                                  prefixIcon: Icons.fingerprint,
                                  width: 0.1,
                                  height: 0.08,
                                )
                              ],
                            ),
                            spacingH(context, 0.04),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomText(
                                  txt: StrLogin().tidakPunyaAkun,
                                  fontId: 1,
                                ),
                                CustomButton(
                                  styleId: 2,
                                  onPress: () => FuncLoginView.signUp(
                                    context,
                                    scrollController,
                                  ),
                                  text: StrLogin().daftar,
                                  height: 0.08,
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ].reversed.toList(),
              );
            }),
      ),
    );
  }
}
