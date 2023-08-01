// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:async';

import 'package:sport/controller/0_bloc/system_bloc/system_bloc.dart';
import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/controller/d_delay_function.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_alert_dialog.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_bottom_dialog.dart';
import 'package:sport/view/3_login_view/login_view.dart';
import 'package:sport/view/6_main_view/widget/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport/controller/6_main_controller/func_mainview.dart';
import 'package:sport/view/6_main_view/widget/navigation_bar.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/6_main_view/2_chat_view/chats_view.dart';
import 'package:sport/view/6_main_view/1_beranda_view/home_view.dart';
import 'package:sport/view/6_main_view/3_notifikasi_view/notification_view.dart';
import 'package:sport/view/6_main_view/4_profil_view/profile_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  late Animation<double> tween;
  late AnimationController anim;
  late Animation<double> sideBarTween;
  late AnimationController sideBarAnim;
  PageController pageController = PageController();
  int currentIndexPage = 0;
  int currentHeaderPage = 0;
  bool navbarClick = false;
  bool navBarAnimate = true;
  Timer? _timer;
  Timer? _timer2;
  List<Widget> page = [];
  bool canExit = false;

  pageSwitching() {
    setState(() {
      anim.reverse();
    });
    _timer = Timer(const Duration(milliseconds: 300), () {
      anim.forward();
      currentHeaderPage = currentIndexPage;

      _timer!.cancel();
    });
  }

  Future<bool> handleBack() async {
    if (sideBarAnim.status == AnimationStatus.completed) {
      sideBarAnim.reverse();
      anim.forward();
      return false;
    } else {
      if (canExit == false) {
        CustomBottomDialog(txt: "On Prosess");
        canExit = true;
        print(canExit);
        DelayFunction.delayFunction(context, onAfterDelay: () {
          canExit = false;
          print(canExit);
        }, durationMillisec: 2000);
        return false;
      } else {
        return true;
      }
    }
  }

  onSideBarShow() {
    navBarAnimate = true;
    anim.reverse();
    sideBarAnim.forward();
  }

  initialValue() {
    GlobalTweenAnimation.oneToZeroTween(context, this,
        setValue: (tweenRes, animRes) {
      tween = tweenRes;
      anim = animRes;
    }, timerFunc: () {
      anim.forward();
    });
    GlobalTweenAnimation.oneToZeroTween(context, this,
        setValue: (tweenRes, animRes) {
      sideBarTween = tweenRes;
      sideBarAnim = animRes;
    }, timerFunc: () {});
  }

  @override
  void initState() {
    initialValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SystemBloc, SystemState>(builder: (context, state) {
      return WillPopScope(
        onWillPop: handleBack,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          child: VisibilityDetector(
            key: Key("main"),
            onVisibilityChanged: (visible) {
              if (visible.visibleFraction == 1.0) {
                anim.forward();
              }
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  AnimatedBuilder(
                      animation: sideBarAnim,
                      builder: (context, widget) {
                        return SideBarProfile(
                          sideBarTween: sideBarTween,
                          sideBarAnim: sideBarAnim,
                          navBarAnim: anim,
                        );
                      }),
                  AnimatedBuilder(
                      animation: anim,
                      builder: (context, widget) {
                        return mainNavigationBar(context,
                            navbarTween: navBarAnimate ? tween : null,
                            onClick: () {
                              pageSwitching();
                              setState(() {
                                navbarClick = true;
                                _timer2 = Timer(
                                    const Duration(milliseconds: 300), () {
                                  navbarClick = false;
                                  _timer2!.cancel();
                                });
                              });
                            },
                            currentIndex: currentIndexPage,
                            onPageChanges: (index) {
                              setState(() {
                                currentIndexPage = index;
                              });
                              pageController.jumpToPage(index);
                            });
                      }),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: getW(context, 0.2),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Warna().backgroundColor(),
                            Warna().transparentTotalBWColor()
                          ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    ),
                  ),
                  PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      if (!navbarClick) {
                        pageSwitching();
                        setState(() {
                          currentIndexPage = index;
                        });
                      }
                    },
                    controller: pageController,
                    children: <Widget>[
                      HomeView(
                        anim: anim,
                      ),
                      ChatsView(anim: anim),
                      NotificationView(),
                      LoginView()
                    ],
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    color: Warna().backgroundColor(),
                  ),
                ].reversed.toList(),
              ),
            ),
          ),
        ),
      );
    });
  }
}
