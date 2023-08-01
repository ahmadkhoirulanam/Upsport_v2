// ignore_for_file: use_key_in_widget_constructors

import 'dart:ui';

import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/controller/d_delay_function.dart';
import 'package:sport/view/0_global/2_widget/backward_button.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:flutter/material.dart';
import 'package:sport/controller/6_main_controller/1_beranda_controller/func_homeview.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/6_main_view/1_beranda_view/1_event_detail_view/widget/apply_button.dart';
import 'package:sport/view/6_main_view/1_beranda_view/1_event_detail_view/widget/konten_text.dart';

class HomeEventDetail extends StatefulWidget {
  final String? imgHeaderTag;
  final Widget? imgHeader;
  const HomeEventDetail(
      {@required this.imgHeaderTag, @required this.imgHeader});
  @override
  _HomeEventDetailState createState() => _HomeEventDetailState();
}

class _HomeEventDetailState extends State<HomeEventDetail>
    with TickerProviderStateMixin {
  late Animation<double> tween;
  late AnimationController anim;
  ScrollController scrollController = ScrollController();
  initialValue() {
    GlobalTweenAnimation.zeroToOneTween(context, this,
        setValue: (tweenRes, animRes) {
      tween = tweenRes;
      anim = animRes;
    }, timerFunc: () {
      DelayFunction.delay200msFunction(context,
          onAfterDelay: () => anim.forward());
    });
  }

  handleBack() {
    FuncHomeView.closeDetail(context, onClick: () {
      anim.reverse();
      scrollController.animateTo(0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn);
    });
  }

  @override
  void initState() {
    initialValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => handleBack(),
      child: AnimatedBuilder(
          animation: anim,
          builder: (context, child) {
            return Scaffold(
              backgroundColor: Warna().backgroundColor(),
              body: Stack(
                children: [
                  BackwardButton(
                    withBgColor: true,
                    customOnPress: () {
                      handleBack();
                    },
                  ),
                  Transform.translate(
                      offset:
                          Offset(0, (1.0 - tween.value) * getW(context, 0.5)),
                      child: ApplyButtonEvent(context)),
                  SingleChildScrollView(
                      controller: scrollController,
                      padding: EdgeInsetsDirectional.only(
                          bottom: getW(context, 0.25)),
                      child: WidgetTween(
                        y: (1.0 - tween.value) * getW(context, 0.3),
                        opacity: tween.value,
                        child: Container(
                            margin: EdgeInsets.only(top: getW(context, 0.6)),
                            child: Stack(
                              children: [
                                Container(
                                  width: getW(context, 1),
                                  margin:
                                      EdgeInsets.only(top: getW(context, 0.05)),
                                  constraints: BoxConstraints(
                                      minHeight: getW(context, 0.3)),
                                  decoration: BoxDecoration(
                                      color: Warna().backgroundColor(),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              getW(context, 0.12)))),
                                  child: KontenTextEvent(),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: getW(context, 0.08)),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: CircleAvatar(
                                        radius: getW(context, 0.06),
                                        backgroundColor: Warna().accentColor(),
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                          size: getW(context, 0.07),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      )),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: getW(context, 1),
                      height: getW(context, 0.8),
                      child: Hero(
                          tag: widget.imgHeaderTag!, child: widget.imgHeader!),
                    ),
                  ),
                ].reversed.toList(),
              ),
            );
          }),
    );
  }
}
