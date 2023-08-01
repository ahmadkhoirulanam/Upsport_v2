import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sport/view/2_intro_view/intro_view.dart';
import 'package:sport/view/0_global/1_value/transition_value.dart';

class FunctionSplash {
  static void pageSwitching(BuildContext context) async {
    Timer? timer2;
    timer2 = Timer(const Duration(milliseconds: 500), () {
      timer2!.cancel();
      goToPage(context, pushReplace: true, page: IntroView());
    });
  }
}
