// // ignore_for_file: unnecessary_null_in_if_null_operators, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

// import 'package:sport/controller/utils/c_global_tween_animation.dart';
// import 'package:sport/controller/utils/d_delay_function.dart';
// import 'package:sport/global/value/color_value.dart';
// import 'package:sport/global/value/size_value.dart';
// import 'package:sport/global/value/transition_value.dart';
// import 'package:sport/global/global_variable.dart';
// import 'package:sport/global/components/widget_transition.dart';
// import 'package:sport/global/custom/custom_button.dart';
// import 'package:sport/global/custom/custom_text.dart';
// import 'package:sport/view/5_reset_password_view/reset_password_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:visibility_detector/visibility_detector.dart';

// class CustomPage extends StatefulWidget {
//   final Widget Function(AnimationController anim, Animation<double> tween)?
//       customAppBar;
//   final Widget Function(AnimationController anim, Animation<double> tween)?
//       contentHeader;
//   final Widget Function(AnimationController anim, Animation<double> tween)?
//       contentScroll;
//   final Widget Function(AnimationController anim, Animation<double> tween)?
//       contentFixed;
//   final Widget Function(AnimationController anim, Animation<double> tween)?
//       contentBackground;
//   final Widget Function(AnimationController anim, Animation<double> tween)?
//       appBarSideButton;
//   final Widget Function(AnimationController anim, Animation<double> tween)?
//       appBarWidget;
//   final Function(
//     AnimationController animContent,
//     AnimationController animAppBar,
//   )? getAnim;
//   final bool? resizeToAvoidBottomInset;
//   final Function(BuildContext context)? onInit;
//   final Function(BuildContext context, AnimationController anim,
//       Animation<double> tween)? onInitWithAnim;
//   final Function(BuildContext context)? onDispose;
//   final Function(BuildContext context, AnimationController anim)? onWillPop;
//   final double? topPaddingContent;
//   final double? bottomPaddingContent;
//   final bool? keepAlive;
//   final String? keyString;
//   final String? title;
//   final bool? enableBackButton;
//   final bool? enableAppBar;
//   final Color? appBarBgColor;
//   final Widget? floatingActionButton;
//   final bool? enablePadding;
//   final bool? overrideAppBar;
//   final bool? enableTweenOpacityHeader;
//   final bool? enableTweenOpacityContent;
//   final double? yTweenHeader;
//   final double? yTweenContent;
//   CustomPage(
//       {this.keyString,
//       this.resizeToAvoidBottomInset,
//       this.appBarWidget,
//       this.keepAlive,
//       this.contentScroll,
//       this.contentFixed,
//       this.getAnim,
//       this.customAppBar,
//       this.onInit,
//       this.onInitWithAnim,
//       this.onDispose,
//       this.onWillPop,
//       this.enableTweenOpacityHeader,
//       this.enableTweenOpacityContent,
//       this.yTweenHeader,
//       this.yTweenContent,
//       this.contentHeader,
//       this.contentBackground,
//       this.appBarBgColor,
//       this.title,
//       this.appBarSideButton,
//       this.floatingActionButton,
//       this.overrideAppBar,
//       this.enablePadding,
//       this.enableAppBar,
//       this.enableBackButton,
//       this.bottomPaddingContent,
//       this.topPaddingContent});
//   @override
//   State<CustomPage> createState() => _CustomPageState();
// }

// class _CustomPageState extends State<CustomPage>
//     with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<CustomPage> {
//   late Animation<double> tween;
//   late AnimationController anim;
//   late Animation<double> tweenAppBar;
//   late AnimationController animAppBar;
//   Key currentKey = UniqueKey();

//   ScrollController scrollController = ScrollController();
//   bool showFloatingButton = true;
//   Rx<bool> showAppBar = true.obs;

//   @override
//   void initState() {
//     initCallback();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     disposeCallback();
//     anim.stop();
//     if (widget.enableAppBar == null || widget.enableAppBar == true) {
//       animAppBar.stop();
//     }
//     super.dispose();
//   }

//   initCallback() {
//     GlobalTweenAnimation.oneToZeroTween(
//       context,
//       this,
//       customDuration:
//           Duration(milliseconds: statusAnimasiAplikasi.value ? 300 : 0),
//       customCurve: Curves.fastOutSlowIn,
//       setValue: (tweenRes, animRes) {
//         tween = tweenRes;
//         anim = animRes;
//       },
//     );
//     if (widget.onInitWithAnim != null) {
//       try {
//         widget.onInitWithAnim!(context, anim, tween);
//       } catch (e) {
//         debugPrint("Error Initial $e");
//       }
//     } else if (widget.onInit != null) {
//       try {
//         widget.onInit!(context);
//       } catch (e) {
//         debugPrint("Error Initial $e");
//       }
//     }
//     if (widget.enableAppBar == null || widget.enableAppBar == true) {
//       GlobalTweenAnimation.zeroToOneTween(
//         context,
//         this,
//         customDuration:
//             Duration(milliseconds: statusAnimasiAplikasi.value ? 300 : 0),
//         customCurve: Curves.fastOutSlowIn,
//         setValue: (tweenRes, animRes) {
//           tweenAppBar = tweenRes;
//           animAppBar = animRes;
//         },
//       );
//     }
//     if (widget.getAnim != null) {
//       try {
//         widget.getAnim!(anim, animAppBar);
//       } catch (e) {
//         debugPrint("Error Initial $e");
//       }
//     }
//   }

//   disposeCallback() {
//     if (widget.onDispose != null) {
//       try {
//         widget.onDispose!(context);
//       } catch (e) {
//         debugPrint("Error Dispose $e");
//       }
//     }
//   }

//   bool getBrightnessTheme({Color? color}) {
//     Color warna =
//         (color != null && color.alpha > 50) ? color : Warna().backgroundColor();
//     double grayscale =
//         (0.299 * warna.red) + (0.587 * warna.green) + (0.114 * warna.blue);
//     if (grayscale > 128) {
//       return false;
//     } else {
//       return true;
//     }
//   }

//   double getStatusBarHeight() {
//     return MediaQuery.of(context).viewPadding.top;
//   }

//   handleBack() => DelayFunction.delay200msClose(context, onBeforeClose: () {
//         anim.reverse();
//       });
//   @override
//   @mustCallSuper
//   Widget build(BuildContext context) {
//     bool initEnableBackButton = widget.enableBackButton ?? true;
//     bool initEnableAppBar = widget.enableAppBar ?? true;
//     bool initEnablePadding = widget.enablePadding ?? true;
//     bool initOverrideAppBar = widget.overrideAppBar ?? false;
//     bool initEnableTweenOpacityHeader = widget.enableTweenOpacityHeader ?? true;
//     bool initEnableTweenOpacityContent =
//         widget.enableTweenOpacityContent ?? true;
//     double initYTweenHeader = widget.yTweenHeader ?? 0.07;
//     double initYTweenContent = widget.yTweenContent ?? 0.05;
//     double initTopPaddingScroll = widget.topPaddingContent ?? 0;
//     double initBottomPaddingScroll = widget.bottomPaddingContent ?? 0;
//     return Obx(
//       () => AnnotatedRegion<SystemUiOverlayStyle>(
//         value: SystemUiOverlayStyle(
//             statusBarColor: Colors.transparent,
//             statusBarIconBrightness: getBrightnessTheme(
//                     color: widget.appBarBgColor ?? Warna().backgroundColor())
//                 ? Brightness.light
//                 : Brightness.dark),
//         child: VisibilityDetector(
//             key: currentKey,
//             onVisibilityChanged: (visible) {
//               if (visible.visibleFraction == 1.0) {
//                 anim.forward();
//               }
//             },
//             child: WillPopScope(
//                 onWillPop: () async {
//                   if (widget.onWillPop != null) {
//                     return await widget.onWillPop!(context, anim) ?? false;
//                   } else {
//                     return handleBack();
//                   }
//                 },
//                 child: Scaffold(
//                   resizeToAvoidBottomInset:
//                       widget.resizeToAvoidBottomInset ?? true,
//                   backgroundColor: Warna().backgroundColor(invert: false),
//                   floatingActionButton: widget.floatingActionButton ?? null,
//                   body: Stack(
//                     children: [
//                       if (initEnableAppBar || widget.customAppBar != null)
//                         WidgetTween(
//                           anim: anim,
//                           tween: tween,
//                           y: -getW(0.05),
//                           child: WidgetTween(
//                             anim: animAppBar,
//                             tween: tweenAppBar,
//                             y: getW(-0.2),
//                             child: widget.customAppBar != null
//                                 ? widget.customAppBar!(anim, tween)
//                                 : Column(
//                                     children: [
//                                       Container(
//                                         height: showAppBar.value
//                                             ? (getW(0.2) + getStatusBarHeight())
//                                             : 0,
//                                         alignment: Alignment.bottomCenter,
//                                         color: widget.appBarBgColor != null
//                                             ? widget.appBarBgColor!
//                                             : initOverrideAppBar
//                                                 ? Colors.transparent
//                                                 : Warna().backgroundColor(),
//                                         padding: EdgeInsets.only(
//                                             left: getW(0.02),
//                                             right: getW(0.05),
//                                             bottom: getW(0.04)),
//                                         child: Row(children: <Widget>[
//                                           if (initEnableBackButton == true)
//                                             CustomButton(
//                                               onPress: () => handleBack(),
//                                               width: 0.1,
//                                               styleId: 2,
//                                               prefixIcon: Icons.arrow_back_ios,
//                                               colorIcon: getBrightnessTheme(
//                                                       color: widget
//                                                               .appBarBgColor ??
//                                                           Warna()
//                                                               .backgroundColor())
//                                                   ? Colors.white
//                                                   : Colors.black,
//                                             ),
//                                           Expanded(
//                                             child: CustomText(
//                                                 txt: widget.title ?? "",
//                                                 maxLines: 2,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 size: 0.05,
//                                                 spacing: 1,
//                                                 bold: true,
//                                                 color: getBrightnessTheme(
//                                                         color: widget
//                                                                 .appBarBgColor ??
//                                                             Warna()
//                                                                 .backgroundColor())
//                                                     ? Colors.white
//                                                     : Colors.black),
//                                           ),
//                                           if (widget.appBarSideButton != null)
//                                             widget.appBarSideButton!(
//                                                 anim, tween)
//                                         ]),
//                                       ),
//                                       if (widget.appBarWidget != null)
//                                         Container(
//                                           color: widget.appBarBgColor != null
//                                               ? widget.appBarBgColor!
//                                               : initOverrideAppBar
//                                                   ? Colors.transparent
//                                                   : Warna().backgroundColor(),
//                                           child:
//                                               widget.appBarWidget!(anim, tween),
//                                         )
//                                     ],
//                                   ),
//                           ),
//                         ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                             // top: initOverrideAppBar ? getW( 0.25) : 0,
//                             left: initEnablePadding ? defaultPadding() : 0.0,
//                             right: initEnablePadding ? defaultPadding() : 0.0,
//                             bottom: initEnablePadding ? defaultPadding() : 0.0),
//                         child: widget.contentFixed != null
//                             ? WidgetTween(
//                                 anim: anim,
//                                 tween: tween,
//                                 enableOpacityAnim:
//                                     initEnableTweenOpacityContent,
//                                 y: getW(initYTweenContent),
//                                 child: Padding(
//                                   padding: EdgeInsets.only(
//                                       top: (initOverrideAppBar
//                                               ? 0
//                                               : initEnableAppBar
//                                                   ? (getW(0.22) +
//                                                       getStatusBarHeight())
//                                                   : 0) +
//                                           getW(initTopPaddingScroll),
//                                       bottom: getW(initBottomPaddingScroll)),
//                                   child: widget.contentFixed!(anim, tween),
//                                 ))
//                             : NotificationListener<ScrollNotification>(
//                                 onNotification: (onScroll) {
//                                   if (initEnableAppBar) {
//                                     if (scrollController
//                                             .position.userScrollDirection ==
//                                         ScrollDirection.reverse) {
//                                       if (scrollController.position.pixels >=
//                                           getW(0.25)) {
//                                         animAppBar.forward();
//                                       }
//                                     } else if (scrollController
//                                             .position.userScrollDirection ==
//                                         ScrollDirection.forward) {
//                                       animAppBar.reverse();
//                                     }
//                                   }
//                                   return true;
//                                 },
//                                 child: SingleChildScrollView(
//                                   padding: EdgeInsets.only(
//                                       top: (initOverrideAppBar
//                                               ? 0
//                                               : initEnableAppBar
//                                                   ? (getW(0.22) +
//                                                       getStatusBarHeight())
//                                                   : 0) +
//                                           getW(initTopPaddingScroll),
//                                       bottom: getW(initBottomPaddingScroll)),
//                                   controller: scrollController,
//                                   child: Column(
//                                     children: [
//                                       if (widget.contentHeader != null)
//                                         WidgetTween(
//                                             anim: anim,
//                                             tween: tween,
//                                             enableOpacityAnim:
//                                                 initEnableTweenOpacityHeader,
//                                             y: -getW(initYTweenHeader),
//                                             child: widget.contentHeader!(
//                                                 anim, tween)),
//                                       if (widget.contentScroll != null)
//                                         WidgetTween(
//                                             anim: anim,
//                                             tween: tween,
//                                             enableOpacityAnim:
//                                                 initEnableTweenOpacityContent,
//                                             y: getW(initYTweenContent),
//                                             child: widget.contentScroll!(
//                                                 anim, tween)),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                       ),
//                       if (widget.contentBackground != null)
//                         WidgetTween(
//                             anim: anim,
//                             tween: tween,
//                             child: widget.contentBackground!(anim, tween)),
//                     ].reversed.toList(),
//                   ),
//                 ))),
//       ),
//     );
//   }

//   @override
//   bool get wantKeepAlive => widget.keepAlive ?? false;
// }
