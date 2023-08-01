import 'package:flutter/material.dart';

String _loremIpsum = "llaurna, porttitor";

class StrIntro {
  static lang<String>({@required String? ind, String? eng}) {
    return ind;
  }

  String introHalaman1 = lang(ind: _loremIpsum);
  String introHalaman2 = lang(ind: _loremIpsum);
  String introHalaman3 = lang(ind: _loremIpsum);
}
