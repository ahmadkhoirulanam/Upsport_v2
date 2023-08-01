import 'dart:async';
import 'package:sport/controller/0_bloc/system_bloc/system_bloc.dart';
import 'package:sport/view/0_global/1_value/variable.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_alert_dialog.dart';
import 'package:sport/view/6_main_view/5_user_view/user_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/transition_value.dart';
import 'package:sport/view/3_login_view/login_view.dart';

class FuncMainView {
  static void logout(BuildContext context, VoidCallback? onClick) {
    CustomAlertDialog(context,
        title: "Log Out",
        contentText: "Lanjutkan Log Out?",
        txtButton1: "Log Out",
        iconHeader: Icons.logout,
        txtButton2: "Batal", funcButton1: () {
      Timer? _timer;
      onClick!();
      _timer = Timer(const Duration(milliseconds: 500), () {
        _timer!.cancel();
        goToPage(context,
            page: const LoginView(
              fromSplashView: true,
            ),
            pushReplace: true);
      });
    });
  }

  static void goToUserProfile(BuildContext context) {
    goToPage(context, page: UserView());
  }

  static void switchTema(BuildContext context) {
    context.read<SystemBloc>().add(ModeTema());
  }

  static void switchBahasa(BuildContext context) {
    context.read<SystemBloc>().add(Bahasa());
  }
}
