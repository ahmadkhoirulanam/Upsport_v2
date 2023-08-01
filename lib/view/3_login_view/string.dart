import 'package:flutter/material.dart';

class StrLogin {
  static lang<String>({@required String? ind, String? eng}) {
    return ind;
  }

  String selamatDatang = lang(ind: "Selamat Datang!", eng: "Welcome Back!");
  String tidakPunyaAkun =
      lang(ind: "Tidak punya akun?", eng: "Don't have an accoung?");
  String lupaPassword = lang(ind: "Lupa Password?", eng: "Forgot Password?");
  String masuk = lang(ind: "Masuk", eng: "Login");
  String daftar = lang(ind: "DAFTAR", eng: "SIGN UP");
}
