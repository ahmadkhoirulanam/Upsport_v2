// ignore_for_file: use_key_in_widget_constructors

import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/controller/d_delay_function.dart';
import 'package:sport/view/0_global/1_value/string_value.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/2_intro_view/string.dart';
import 'package:flutter/material.dart';
import 'package:sport/controller/2_intro_controller/function.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/2_intro_view/widget/blumb_header.dart';
import 'package:sport/view/2_intro_view/widget/content_page.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroView extends StatefulWidget {
  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> with TickerProviderStateMixin {
  PageController pageController = PageController();
  late Animation<double> tween;
  late AnimationController anim;
  late Animation<double> tweenHeader;
  late AnimationController animHeader;
  int currentIndex = 0;
  bool showSkipBtn = true;
  String buttonText = StrGlobal().selanjutnya;

  initValue() {
    GlobalTweenAnimation.zeroToOneTween(context, this,
        setValue: (tweenRes, animRes) {
      tween = tweenRes;
      anim = animRes;
    }, timerFunc: () {
      anim.forward();
    });
    GlobalTweenAnimation.zeroToOneTween(context, this,
        customDuration: const Duration(milliseconds: 300),
        setValue: (tweenRes, animRes) {
      tweenHeader = tweenRes;
      animHeader = animRes;
    }, timerFunc: () {
      animHeader.forward();
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Warna().backgroundColor(),
      body: AnimatedBuilder(
          animation: anim,
          builder: (context, widget) {
            return Stack(
              children: [
                BlumbHeaderIntro(
                  tween: tween,
                ),
                AnimatedBuilder(
                    animation: animHeader,
                    builder: (context, widget) {
                      return WidgetTween(
                        opacity: tween.value,
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView(
                                controller: pageController,
                                physics: const NeverScrollableScrollPhysics(),
                                onPageChanged: (index) {
                                  setState(() {
                                    if (index == 2) {
                                      buttonText = StrGlobal().lewati;
                                      showSkipBtn = false;
                                    } else {
                                      buttonText = StrGlobal().selanjutnya;
                                      showSkipBtn = true;
                                    }
                                  });
                                },
                                children: [
                                  ContentPageIntro(
                                      tween: tween,
                                      tweenHeader: tweenHeader,
                                      contentImage: ImgLoader.intro1,
                                      contentText:
                                          "UPSport Adalah Aplikasi Berbasis Mobile untuk memudahkan pemesanan lapangan, pelatih, wasit, toko olahraga dan lain sebagainya."),
                                  ContentPageIntro(
                                      tween: tween,
                                      tweenHeader: tweenHeader,
                                      contentImage: ImgLoader.intro2,
                                      contentText:
                                          "Aplikasi ini dikembangkan oleh Program studi PJKR Universitas PGRI Semarang"),
                                  ContentPageIntro(
                                      tween: tween,
                                      tweenHeader: tweenHeader,
                                      contentImage: ImgLoader.intro3,
                                      contentText:
                                          "Aplikasi ini masih dalam tahap pengembangan, sehingga belum semua menu berfungsi dengan baik. Pengembangan setiap menu akan terus di update secara bertahap"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getW(context, 0.05),
                              child: SmoothPageIndicator(
                                  controller: pageController,
                                  count: 3,
                                  effect: ExpandingDotsEffect(
                                      dotHeight: getW(context, 0.02),
                                      dotWidth: getW(context, 0.02),
                                      activeDotColor: Warna().accentColor(),
                                      dotColor: Colors.grey.shade300),
                                  onDotClicked: (index) {}),
                            ),
                            CustomButton(
                                text: buttonText,
                                width: 0.8,
                                onPress: () {
                                  animHeader.reverse();
                                  DelayFunction.delay300msFunction(context,
                                      onAfterDelay: () {
                                    currentIndex++;
                                    if (currentIndex <= 2) animHeader.forward();
                                    FunctionIntro.nextPage(
                                      context,
                                      pageController: pageController,
                                      index: currentIndex,
                                    );
                                  });
                                }),
                            SizedBox(
                              height: getW(context, 0.15),
                              child: showSkipBtn
                                  ? CustomButton(
                                      styleId: 2,
                                      width: 0.8,
                                      text: StrGlobal().lewati,
                                      onPress: () =>
                                          FunctionIntro.skip(context))
                                  : const SizedBox(),
                            )
                          ],
                        ),
                      );
                    }),
              ],
            );
          }),
    );
  }
}
