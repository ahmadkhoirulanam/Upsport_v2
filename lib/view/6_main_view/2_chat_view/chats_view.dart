// ignore_for_file: use_key_in_widget_constructors

import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/view/6_main_view/2_chat_view/widget/header_chats.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/6_main_view/2_chat_view/widget/chats_card.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';

class ChatsView extends StatefulWidget {
  final AnimationController? anim;
  const ChatsView({@required this.anim});
  @override
  _ChatsViewState createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> with TickerProviderStateMixin {
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
                mainHeaderChats(context, tweenValue: headerTween.value),
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
              padding: EdgeInsets.symmetric(horizontal: defaultPadding()),
              child: ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                      bottom: getW(context, 0.24), top: getW(context, 0.25)),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return chatsCard(anim: widget.anim);
                  }),
            ),
          ),
        ].reversed.toList(),
      ),
    );
  }
}
