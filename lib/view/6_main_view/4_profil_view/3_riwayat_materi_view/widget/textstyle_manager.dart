//Text

// textNormal(BuildContext context, String txt,
//     {Color? color, double? size, TextAlign? align}) {
//   return Text(
//     txt,
//     textAlign: align != null ? align : TextAlign.start,
//     style: hnnormal(
//       context,
//       txtColor: color != null ? color : Colors.black,
//       txtSize:
//           size != null ? getWidth(context, size) : getWidth(context, 0.032),
//     ),
//   );
// }

// textBold(BuildContext context, String txt,
//     {Color? color, double? size, TextAlign? align, double? padding}) {
//   return Padding(
//     padding: EdgeInsets.all(getWidth(context, padding != null ? padding : 0)),
//     child: Text(
//       txt,
//       textAlign: align != null ? align : TextAlign.start,
//       style: hnnormal(
//         context,
//         txtColor: color != null ? color : Colors.black,
//         txtSize:
//             size != null ? getWidth(context, size) : getWidth(context, 0.032),
//         txtWeight: FontWeight.bold,
//       ),
//     ),
//   );
// }

import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:flutter/material.dart';

helveticaNeue(BuildContext context,
    {Color? txtColor,
    double? txtSize,
    FontWeight? txtWeight,
    FontStyle? txtStyle,
    double? spacing}) {
  return TextStyle(
      color: txtColor == null ? Colors.black : txtColor,
      fontFamily: "Helvetica Neue",
      letterSpacing: spacing == null ? 0 : spacing,
      fontStyle: txtStyle == null ? FontStyle.normal : txtStyle,
      fontSize: txtSize == null ? getW(context, 0.032) : txtSize,
      fontWeight: txtWeight == null ? FontWeight.normal : txtWeight);
}
