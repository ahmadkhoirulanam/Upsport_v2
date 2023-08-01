// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/controller/d_delay_function.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:sport/view/6_main_view/1_beranda_view/3_agenda_detail_view/widget/agenda_header.dart';
import 'package:sport/view/6_main_view/1_beranda_view/3_agenda_detail_view/widget/garis_timeline.dart';
import 'package:sport/view/6_main_view/1_beranda_view/3_agenda_detail_view/widget/item_agenda.dart';
import 'package:flutter/material.dart';

class AgendaDetailMain extends StatefulWidget {
  @override
  _AgendaDetailMainState createState() => _AgendaDetailMainState();
}

class _AgendaDetailMainState extends State<AgendaDetailMain>
    with TickerProviderStateMixin {
  late Animation<double> tween;
  late AnimationController anim;
  initialValue() {
    GlobalTweenAnimation.oneToZeroTween(context, this,
        setValue: (tweenRes, animRes) {
      tween = tweenRes;
      anim = animRes;
    }, timerFunc: () {
      anim.forward();
    });
  }

  handleBack() {
    DelayFunction.delay200msClose(context, onBeforeClose: () {
      anim.reverse();
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
      child: Scaffold(
        backgroundColor: Warna().backgroundColor(),
        body: AnimatedBuilder(
            animation: anim,
            builder: (context, widget) {
              return Column(
                children: [
                  WidgetTween(
                      y: -(tween.value * getW(context, 0.5)),
                      child: AgendaHeader()),
                  Expanded(
                    child: Stack(
                      children: [
                        GarisTimeLine(),
                        SingleChildScrollView(
                            child: Padding(
                          padding: EdgeInsets.only(
                            left: defaultPadding(),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(bottom: getW(context, 0.05)),
                            child: Column(
                              children: [
                                Container(
                                  height: getW(context, 0.15),
                                  decoration: BoxDecoration(
                                      color: Warna().backgroundColor()),
                                  child: Row(
                                    children: [
                                      CustomText(
                                        txt: "Now",
                                        align: Alignment.bottomLeft,
                                        semibold: true,
                                        width: 0.19,
                                        height: 0.045,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: CircleAvatar(
                                          radius: getW(context, 0.02),
                                          backgroundColor: Colors.grey.shade200,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                WidgetTween(
                                  y: tween.value * getH(context, 0.9),
                                  child: ListView.builder(
                                      itemCount: 8,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return ItemAgenda();
                                      }),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
