// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:sport/view/0_global/2_widget/backward_button.dart';
import 'package:flutter/material.dart';
import 'package:sport/controller/6_main_controller/2_chat_controlller/func_chatsview.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:sport/view/0_global/2_widget/image_loader.dart';

class ChatsVoiceCall extends StatefulWidget {
  final Widget? photo;
  ChatsVoiceCall({@required this.photo});
  @override
  _ChatsVoiceCallState createState() => _ChatsVoiceCallState();
}

class _ChatsVoiceCallState extends State<ChatsVoiceCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackwardButton(
            withBgColor: true,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Transform.translate(
              offset: Offset(0, getW(context, 0.36)),
              child: Column(
                children: [
                  Hero(
                    tag: "profilePhoto",
                    child: CircleAvatar(
                      radius: getW(context, 0.24),
                      backgroundColor: Warna().accentColor(),
                      child: ImgLoader.examplePhoto1mini,
                    ),
                  ),
                  CustomText(
                    toppad: 0.02,
                    txt: "Nama User",
                    fontId: 2,
                    semibold: true,
                    color: Colors.white,
                    size: 0.08,
                  ),
                  CustomText(
                    txt: "Calling...",
                    color: Colors.white,
                    fontId: 2,
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: getW(context, 0.1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: getW(context, 0.25),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: getW(context, 0.08),
                            backgroundColor:
                                const Color.fromARGB(255, 15, 185, 0),
                            child: Icon(
                              Icons.call_outlined,
                              size: getW(context, 0.08),
                              color: Colors.white,
                            ),
                          ),
                          CustomText(
                            txt: "Accept",
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getW(context, 0.25),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: getW(context, 0.08),
                            backgroundColor:
                                const Color.fromARGB(255, 255, 0, 0),
                            child: Icon(
                              Icons.call_end_outlined,
                              size: getW(context, 0.08),
                              color: Colors.white,
                            ),
                          ),
                          CustomText(
                            txt: "Decline",
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(color: Colors.black26),
            ),
          ),
          SizedBox(
            width: getW(context, 1),
            height: getH(context, 1),
            child: ImgLoader.examplePhoto1,
          ),
        ].reversed.toList(),
      ),
    );
  }
}
