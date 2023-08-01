import 'package:sport/controller/0_bloc/system_bloc/system_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SharedPrefs {
  ///metode = "save", "get"
  static void switchModeTema(BuildContext context,
      {@required String? fungsi, int? modeTemaId}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (fungsi!.toLowerCase() == "save") {
      _prefs.setInt('modeTemaId', modeTemaId!);
    } else if (fungsi.toLowerCase() == "get") {
      int initialDarkMode = _prefs.getInt('modeTemaId') != null
          ? _prefs.getInt('modeTemaId')!
          : 2;
      if (initialDarkMode == 1) {
        context.read<SystemBloc>().add(ModeTema(idTema: 1));
      } else if (initialDarkMode == 2) {
        context.read<SystemBloc>().add(ModeTema(idTema: 2));
      }
    }
  }
}
