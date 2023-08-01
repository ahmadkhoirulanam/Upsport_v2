import 'package:sport/view/0_global/1_value/variable.dart';
import 'package:flutter/material.dart';

String languageLoad({@required String? ind, String? eng}) {
  return bahasaId == 0 ? ind! : eng ?? ind!;
}
