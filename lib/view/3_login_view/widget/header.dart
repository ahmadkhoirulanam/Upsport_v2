// // ignore_for_file: use_key_in_widget_constructors

// part of '../login_view.dart';

// class _Header extends StatelessWidget {
//   final AnimationController? headerOffsetAnim;
//   final Animation<double>? headerOffsetTween;
//   const _Header(this.headerOffsetAnim, this.headerOffsetTween);
//   @override
//   Widget build(BuildContext context) {
//     Widget header() {
//       return SizedBox(
//         height: getW(0.8),
//         child: SingleChildScrollView(
//           reverse: true,
//           physics: const NeverScrollableScrollPhysics(),
//           child: Stack(
//             children: [
//               WidgetTween(
//                 x: 0,
//                 y: 0,
//                 child: ClipShadowPath(
//                   clipper: HeaderClipper(),
//                   shadow: Shadow(
//                       blurRadius: getW(0.02),
//                       color: Colors.black26,
//                       offset: Offset(0, getW(0.035))),
//                   child: Container(
//                     height: getW(1.2),
//                     color: Warna().accentColor(),
//                   ),
//                 ),
//               ),
//               Positioned.fill(
//                   child: WidgetTween(
//                 y: -getW(0.35),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     SizedBox(
//                       height: getW(0.2),
//                       child: ImgLoader.logoApp,
//                     ),
//                     CustomText(
//                       txt: GlobalString().namaApp,
//                       size: 0.06,
//                       bold: true,
//                       toppad: 0.02,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//               )),
//             ],
//           ),
//         ),
//       );
//     }

//     return headerOffsetAnim != null
//         ? WidgetTween(
//             anim: headerOffsetAnim,
//             tween: headerOffsetTween,
//             y: -getW(0.8),
//             child: header())
//         : header();
//   }
// }
