import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:flutter/material.dart';

class GarisTimeLine extends StatelessWidget {
  const GarisTimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: getW(context, 0.265)),
      width: getW(context, 0.01),
      height: double.infinity,
      color: Colors.grey.shade200,
    );
  }
}
