import 'package:sport/view/0_global/1_value/variable.dart';
import 'package:flutter/cupertino.dart';

///Set Percent Of Context Width
double getW(BuildContext context, double percent) {
  return MediaQuery.of(context).size.width * percent;
}

///Set Percent Of Context Height
double getH(BuildContext context, double percent) {
  return MediaQuery.of(context).size.height * percent;
}

Widget spacingW(BuildContext context, double percent) {
  return SizedBox(
    width: getW(context, percent),
  );
}

Widget spacingH(BuildContext context, double percent) {
  return SizedBox(
    height: getW(context, percent),
  );
}

double defaultPadding() {
  return MediaQuery.of(navKey.currentContext!).size.width * 0.06;
}

BorderRadius defaultBorderRadius(BuildContext context) {
  return BorderRadius.circular(getW(context, 0.03));
}

double tweenGetW(BuildContext context,
    {@required Animation<double>? tween,
    @required double? percent,
    bool? invert}) {
  bool initInvert = invert ?? false;
  return initInvert
      ? (1.0 - tween!.value) * getW(context, percent!)
      : tween!.value * getW(context, percent!);
}

double tweenGetH(BuildContext context,
    {@required Animation<double>? tween,
    @required double? percent,
    bool? invert}) {
  bool initInvert = invert ?? false;
  return initInvert
      ? (1.0 - tween!.value) * getH(context, percent!)
      : tween!.value * getH(context, percent!);
}
