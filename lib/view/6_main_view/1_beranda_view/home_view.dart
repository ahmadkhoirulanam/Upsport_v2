// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/6_main_view/1_beranda_view/widget/header_home.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/6_main_view/1_beranda_view/widget/berita_list.dart';
import 'package:sport/view/6_main_view/1_beranda_view/widget/diskusi_list.dart';
import 'package:sport/view/6_main_view/1_beranda_view/widget/event_list.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/6_main_view/1_beranda_view/widget/ewallet_card.dart';
import 'package:sport/view/6_main_view/1_beranda_view/widget/fitur_list_button.dart';

class HomeView extends StatefulWidget {
  final AnimationController? anim;
  const HomeView({@required this.anim});
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late Animation<double> headerTween;
  late AnimationController headerAnim;

  @override
  void initState() {
    initial();
    super.initState();
  }

  initial() {
    GlobalTweenAnimation.zeroToOneTween(context, this,
        customDuration: Duration(milliseconds: 300),
        customCurve: Curves.ease, setValue: (tween, anim) {
      headerTween = tween;
      headerAnim = anim;
    }, timerFunc: () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: headerAnim,
            builder: (context, widgetState) =>
                mainHeaderHome(context, tweenValue: headerTween.value),
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (onScroll) {
              if (scrollController.position.pixels >= getW(context, 0.34)) {
                if (!headerAnim.isAnimating) {
                  headerAnim.forward();
                }
              } else {
                if (!headerAnim.isAnimating) {
                  headerAnim.reverse();
                }
              }
              return true;
            },
            child: SingleChildScrollView(
              controller: scrollController,
              padding: EdgeInsets.only(
                  bottom: getW(context, 0.3), top: getW(context, 0.38)),
              child: Column(
                children: [
                  eWalletCard(context),
                  fiturListButton(
                    context,
                    anim: widget.anim,
                  ),
                  // eventListHome(context, anim: widget.anim),
                  // diskusiList(context),
                  beritaList(context, anim: widget.anim),
                  eventListHome(context, anim: widget.anim),
                ],
              ),
            ),
          ),
        ].reversed.toList(),
      ),
    );
  }
}
