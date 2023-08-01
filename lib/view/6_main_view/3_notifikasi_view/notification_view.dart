// ignore_for_file: use_key_in_widget_constructors

import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/view/6_main_view/3_notifikasi_view/widget/header_notification.dart';
import 'package:sport/view/6_main_view/4_profil_view/widget/header_profile.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/6_main_view/3_notifikasi_view/widget/notification_card.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:flutter/rendering.dart';

class NotificationView extends StatefulWidget {
  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView>
    with TickerProviderStateMixin {
  List<bool> exampleList = [
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
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
        customDuration: const Duration(milliseconds: 300),
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
                mainHeaderNotification(context, tweenValue: headerTween.value),
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getW(context, 0.06)),
              child: ListView.builder(
                  shrinkWrap: true,
                  controller: scrollController,
                  padding: EdgeInsets.only(
                      bottom: getW(context, 0.24), top: getW(context, 0.25)),
                  itemCount: exampleList.length,
                  itemBuilder: (context, index) {
                    return notificationCard(markUnread: exampleList[index]);
                  }),
            ),
          ),
        ].reversed.toList(),
      ),
    );
  }
}
