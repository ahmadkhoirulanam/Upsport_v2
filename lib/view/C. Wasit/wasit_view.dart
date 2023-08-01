// ignore_for_file: use_key_in_widget_constructors

import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/view/6_main_view/1_beranda_view/widget/berita_list.dart';
import 'package:sport/view/6_main_view/1_beranda_view/widget/event_list.dart';
import 'package:sport/view/B.%20Pelatih/widget/header_pelatih.dart';
import 'package:sport/view/6_main_view/4_profil_view/2_promo_view/widget/header_promo.dart';
import 'package:sport/view/6_main_view/4_profil_view/2_promo_view/widget/menulapangan.dart';
import 'package:sport/view/B.%20Pelatih/widget/menulapelatih.dart';
import 'package:sport/view/6_main_view/4_profil_view/2_promo_view/widget/promo_card.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/C.%20Wasit/widget/header_wasit.dart';
import 'package:sport/view/C.%20Wasit/widget/menuwasit.dart';

class Wasit extends StatefulWidget {
  final AnimationController? anim;
  const Wasit({@required this.anim});
  @override
  _WasitState createState() => _WasitState();
}

class _WasitState extends State<Wasit> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late Animation<double> headerTween;
  late AnimationController headerAnim;

  @override
  void initState() {
    initial();
    super.initState();
  }

  initial() {
    GlobalTweenAnimation.zeroToOneTween(context, this,
        customDuration: const Duration(milliseconds: 300),
        customCurve: Curves.ease, setValue: (tween, anim) {
      headerTween = tween;
      headerAnim = anim;
    }, timerFunc: () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: headerAnim,
            builder: (context, widgetState) =>
                mainHeaderWasit(context, tweenValue: headerTween.value),
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (onScroll) {
              if (scrollController.position.pixels >= getW(context, 0.34)) {
                if (!headerAnim.isAnimating) {
                  headerAnim.forward();
                }
              } else {
                if (!headerAnim.isAnimating) {
                  headerAnim.reverse();
                }
              }
              return true;
            },
            child: SingleChildScrollView(
              controller: scrollController,
              padding: EdgeInsets.only(
                  bottom: getW(context, 0.3), top: getW(context, 0.38)),
              child: Column(
                children: [
                  MenuWasit(
                    context,
                    anim: widget.anim,
                  ),
                  // eventListHome(context, anim: widget.anim),
                  // diskusiList(context),
                  beritaList(context, anim: widget.anim),
                  eventListHome(context, anim: widget.anim),
                ],
              ),
            ),
          ),
        ].reversed.toList(),
      ),
    );
  }
}
