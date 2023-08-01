// ignore_for_file: prefer_const_constructors

import 'package:sport/view/0_global/1_value/variable.dart';
import 'package:flutter/material.dart';

class Warna {
  Color _loadTheme({@required Color? light, @required Color? dark}) {
    if (themeModeId == 2) {
      var brightness = light;
      bool isDarkMode = brightness == Brightness.dark;

      return dark != null
          ? !isDarkMode
              ? light!
              : dark
          : light!;
    } else {
      return dark != null
          ? themeModeId == 0
              ? light!
              : dark
          : light!;
    }
  }

  Color backgroundColor() {
    return _loadTheme(
        light: Colors.white, dark: Color.fromARGB(255, 23, 25, 26));
  }

  Color accentColor() {
    return _loadTheme(light: Color.fromARGB(255, 42, 128, 227), dark: null);
  }

  Color accentColorCerah() {
    return _loadTheme(light: Color.fromARGB(255, 17, 162, 166), dark: null);
  }

  Color accentColor70() {
    return _loadTheme(light: Color.fromARGB(180, 0, 149, 153), dark: null);
  }

  Color buttonColor1Background() {
    return _loadTheme(
        light: Color.fromARGB(255, 227, 242, 242),
        dark: Color.fromARGB(30, 227, 242, 242));
  }

  Color buttonColor1Foreground() {
    return _loadTheme(light: Color.fromARGB(255, 141, 172, 173), dark: null);
  }

  Color buttonColor2Background() {
    return _loadTheme(
        light: Color.fromARGB(5, 25, 25, 25),
        dark: Color.fromARGB(5, 255, 255, 255));
  }

  Color accentTransparentColor({int? aplha}) {
    return _loadTheme(
        light: Color.fromARGB(aplha ?? 20, 0, 149, 153),
        dark: Color.fromARGB(aplha ?? 20, 27, 122, 124));
  }

  Color transparentBWColor({int? aplha}) {
    return _loadTheme(
        light: Color.fromARGB(aplha ?? 100, 0, 0, 0),
        dark: Color.fromARGB(aplha ?? 100, 255, 255, 255));
  }

  Color transparentTotalBWColor() {
    return _loadTheme(
      light: Color.fromARGB(0, 255, 255, 255),
      dark: Color.fromARGB(0, 0, 24, 24),
    );
  }

  Color fontColor1() {
    return _loadTheme(light: Colors.black, dark: Colors.white);
  }

  Color blueColor() {
    return const Color.fromARGB(255, 64, 123, 255);
  }

  Color eWalletAccentColor() {
    return const Color.fromARGB(255, 0, 175, 212);
  }
}
