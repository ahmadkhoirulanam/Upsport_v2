// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:sport/controller/d_delay_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:sport/view/0_global/1_value/transition_value.dart';
import 'package:sport/view/6_main_view/2_chat_view/1_percakapan_view/percakapan_view.dart';
import 'package:sport/view/6_main_view/2_chat_view/2_voice_call_view/voice_call_view.dart';

class FuncChatsView {
  static void chatCardClick(BuildContext context,
      {@required AnimationController? anim}) {
    DelayFunction.delay200msFunction(context, onBeforeDelay: () {
      anim!.reverse();
    }, onAfterDelay: () {
      goToPage(context, page: ChatsConversation());
    });
  }

  static void closeChatConversation(BuildContext context,
      {@required VoidCallback? onClick}) {
    Timer? _timer;
    onClick!();
    _timer = Timer(const Duration(milliseconds: 400), () {
      _timer!.cancel();
      Navigator.pop(context);
    });
  }

  static void voiceCallClick(BuildContext context, {@required Widget? photo}) {
    goToPage(context,
        page: ChatsVoiceCall(
          photo: photo,
        ));
  }

  static void closeVoiceCall(BuildContext context,
      {@required VoidCallback? onClick}) {
    Timer? _timer;
    onClick!();
    _timer = Timer(const Duration(milliseconds: 400), () {
      _timer!.cancel();
      Navigator.pop(context);
    });
  }
}
