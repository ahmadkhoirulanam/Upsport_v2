import 'package:flutter/material.dart';
import 'package:sport/view/3_login_view/login_view.dart';
import 'package:sport/view/0_global/1_value/transition_value.dart';
import 'package:sport/view/6_main_view/main_view.dart';

class FunctionIntro {
  static void nextPage(BuildContext context,
      {@required PageController? pageController, @required int? index}) {
    if (index == 3) {
      // goToPage(context,
      //     pushReplace: true, page: const LoginView(fromSplashView: false));
      goToPage(context, page: MainView(), pushReplace: true);
    } else {
      pageController!.jumpToPage(index!);
    }
  }

  static void skip(BuildContext context) {
    // goToPage(context,
    //     pushReplace: true, page: const LoginView(fromSplashView: false));
    goToPage(context, page: MainView(), pushReplace: true);
  }
}
