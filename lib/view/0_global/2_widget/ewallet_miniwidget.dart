import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';

class EWalletMiniWidget extends StatelessWidget {
  const EWalletMiniWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getW(context, 0.2),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              width: getW(context, 0.01), color: Warna().eWalletAccentColor())),
    );
  }
}
