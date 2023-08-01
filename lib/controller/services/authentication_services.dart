import 'dart:convert';
import 'package:sport/controller/d_delay_function.dart';
import 'package:sport/controller/utils/prefs_write.dart';
import 'package:sport/view/0_global/1_value/transition_value.dart';
import 'package:sport/view/0_global/1_value/variable.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_bottom_dialog.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_loading_dialog.dart';
import 'package:sport/view/0_global/view/global_api_address.dart';
import 'package:sport/view/3_login_view/login_view.dart';
import 'package:sport/view/6_main_view/main_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthenticationServices extends GetxController {
  void login(BuildContext context, AnimationController anim,
      {@required String? username, @required String? password}) async {
    CustomLoadingDialog();
    try {
      var post = Uri.parse(ApiAddressAuth.login);
      var result = await http.post(post, headers: {
        "Accept": "application/json"
      }, body: {
        "username": username!,
        "password": password!,
      });
      var toJson = await jsonDecode(result.body);
      if (toJson["success"] == true && toJson["data"] != null) {
        Navigator.pop(navKey.currentContext!);
        PrefsWrite.alreadyLogin(true);
        goToPageClearOtherStack(context, anim: anim, page: MainView());
      } else {
        Navigator.pop(navKey.currentContext!);
        CustomBottomDialog(
            txt: toJson["message"] == "Username Salah"
                ? "User Name Tidak Ditemukan"
                : toJson["message"]);
      }
    } catch (e) {
      Navigator.pop(navKey.currentContext!);
      debugPrint(e.toString());
      CustomBottomDialog(txt: "Terjadi Kesalahan Saat Registrasi");
    }
  }

  void logOut(BuildContext context) {
    PrefsWrite.alreadyLogin(false);
    DelayFunction.delay200msFunction(context,
        onAfterDelay: () =>
            goToPageClearOtherStack(context, page: LoginView()));
  }
}
