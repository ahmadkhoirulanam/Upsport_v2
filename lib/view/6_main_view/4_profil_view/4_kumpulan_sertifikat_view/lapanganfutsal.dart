// ignore_for_file: use_key_in_widget_constructors

import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/view/6_main_view/4_profil_view/3_riwayat_materi_view/widget/header_riwayat_materi.dart';
import 'package:sport/view/6_main_view/4_profil_view/4_kumpulan_sertifikat_view/widget/serifikat_card.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';

class lapanganfutsal extends StatefulWidget {
  final AnimationController? anim;
  const lapanganfutsal({@required this.anim});
  @override
  _lapanganfutsalState createState() => _lapanganfutsalState();
}

class _lapanganfutsalState extends State<lapanganfutsal>
    with TickerProviderStateMixin {
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
                mainHeaderRiwayatMateri(context, tweenValue: headerTween.value),
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding()),
              child: ListView.builder(
                  shrinkWrap: true,
                  controller: scrollController,
                  padding: EdgeInsets.only(
                      bottom: getW(context, 0.24), top: getW(context, 0.5)),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SertikatCard();
                  }),
            ),
          ),
        ].reversed.toList(),
      ),
    );
  }
}
