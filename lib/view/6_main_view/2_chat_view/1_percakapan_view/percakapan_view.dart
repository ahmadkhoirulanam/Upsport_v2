// ignore_for_file: use_key_in_widget_constructors

import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:flutter/material.dart';
import 'package:sport/controller/6_main_controller/2_chat_controlller/func_chatsview.dart';
import 'package:sport/view/6_main_view/2_chat_view/1_percakapan_view/widget/bottom_widget.dart';
import 'package:sport/view/6_main_view/2_chat_view/1_percakapan_view/widget/bubble_message.dart';
import 'package:sport/view/6_main_view/2_chat_view/1_percakapan_view/widget/header.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';

class ChatsConversation extends StatefulWidget {
  const ChatsConversation();
  @override
  _ChatsConversationState createState() => _ChatsConversationState();
}

class _ChatsConversationState extends State<ChatsConversation>
    with TickerProviderStateMixin {
  List exampleList = [
    true,
    false,
    true,
    false,
    false,
    true,
    false,
    false,
    true
  ];
  List exampleList2 = [
    "Halo Bang",
    "Iya Dik",
    "Bagaimana cara daftar komunitas programmer semarang",
    "Kamu cari grup komunitas, nanti klik aja disana ada tombol gabung, di sudut halaman nanti ada tombol nya, cari-cari aja ya",
    "cari di beranda, search aja nama komunitasnya",
    "Oke terima kasih bang",
    "Sama-sama",
    "Oiya gabung juga dong ke komunitas abang, lumayan banyak anggotanya, siapa tau dapat teman baru",
    "Siap bang"
  ];

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
    FuncChatsView.closeChatConversation(context, onClick: () {
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
              return Padding(
                padding: EdgeInsets.only(top: getW(context, 0.06)),
                child: Column(
                  children: [
                    Transform.translate(
                      offset: Offset(0, -getW(context, tween.value)),
                      child: HeaderPercakapan(context,
                          onBackPress: () => handleBack()),
                    ),
                    spacingH(context, 0.03),
                    Expanded(
                      child: ListView.builder(
                          itemCount: exampleList.length,
                          itemBuilder: (context, index) {
                            return BubbleMessagePercakapan(context,
                                containerTween: tween,
                                fromMe: exampleList[index],
                                text: exampleList2[index]);
                          }),
                    ),
                    Transform.translate(
                      offset: Offset(0, getW(context, tween.value)),
                      child: BottomWidgetPercakapan(context),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
