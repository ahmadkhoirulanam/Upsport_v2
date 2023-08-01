import 'dart:async';

import 'package:sport/controller/d_delay_function.dart';
import 'package:sport/view/0_global/1_value/variable.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/transition_value.dart';
import 'package:sport/view/3_login_view/login_view.dart';
import 'package:sport/view/6_main_view/main_view.dart';

class FuncLoginView {
  static void login(BuildContext context, {@required VoidCallback? onClick}) {
    Timer? _timer;
    CustomLoadingDialog();
    DelayFunction.delayFunction(context, durationMillisec: 3000,
        onAfterDelay: () {
      onClick!();
      _timer = Timer(const Duration(milliseconds: 500), () {
        _timer!.cancel();
        Navigator.pop(navKey.currentContext!);
        goToPage(context, page: MainView(), pushReplace: true);
      });
    });
  }

  static void signUp(
    BuildContext context,
    ScrollController scrollController,
  ) {
    Timer? _timer;
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    _timer = Timer(const Duration(milliseconds: 300), () {
      _timer!.cancel();
      goToPage(context, page: LoginView());
    });
  }

  static void forgotPassword(
      BuildContext context, ScrollController scrollController) {
    Timer? _timer;
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    _timer = Timer(const Duration(milliseconds: 300), () {
      _timer!.cancel();
      goToPage(context, page: LoginView());
    });
  }
}
