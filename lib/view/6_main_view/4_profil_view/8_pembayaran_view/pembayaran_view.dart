// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, missing_required_param

import 'package:sport/controller/0_bloc/system_bloc/system_bloc.dart';
import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_card.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:sport/view/6_main_view/4_profil_view/5_pusat_bantuan_view/widget/header_pusatbantuan.dart';
import 'package:sport/view/6_main_view/4_profil_view/8_pembayaran_view/widget/pembayaran_list.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pembayaran extends StatefulWidget {
  final VoidCallback? onMoreClick;
  Pembayaran({@required this.onMoreClick});
  @override
  _PembayaranState createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late Animation<double> headerTween;
  // late AnimationController anim;
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
    return BlocBuilder<SystemBloc, SystemState>(builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(children: [
            AnimatedBuilder(
                animation: headerAnim,
                builder: (context, widgetState) => mainHeaderPusatBantuan(
                    context,
                    tweenValue: headerTween.value)),
            NotificationListener<ScrollNotification>(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: getW(context, 0.25), top: getW(context, 0.25)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: defaultPadding()),
                      child: CustomCard(
                          styleId: 2,
                          width: 1,
                          rightmargin: 0.02,
                          bottommargin: 0.03,
                          allpadding: 0,
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 6),
                                    child: Row(
                                      children: [
                                        CustomButton(
                                          styleId: 2,
                                          onPress: () {},
                                          colorAccent: Warna().accentColor(),
                                          topMargin: 0.01,
                                          rightMargin: 0.01,
                                          leftMargin: 0.02,
                                          height: 0.07,
                                          colorIcon: Colors.white,
                                          width: 0.07,
                                        ),
                                        CustomText(
                                          txt: "Dompet Digital",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          semibold: true,
                                          fontId: 2,
                                          leftpad: 0.02,
                                          toppad: 0.01,
                                          rightpad: 0.02,
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomText(
                                    txt: "Rp. 741,-",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    semibold: true,
                                    fontId: 2,
                                    toppad: 0.02,
                                    leftpad: 0.03,
                                    rightpad: 0.02,
                                  ),
                                  Divider(
                                    height: getW(context, 0.08),
                                    thickness: getW(context, 0.003),
                                  ),
                                  spacingH(context, 0.01),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CustomButton(
                                              styleId: 2,
                                              width: 0.1,
                                              height: 0.1,
                                              onPress: () {},
                                              prefixIcon:
                                                  Icons.monetization_on),
                                          CustomText(
                                            txt: "5000 GoPay Coins",
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: getW(context, 0.02)),
                                          child: CustomButton(
                                              styleId: 2,
                                              width: 0.1,
                                              height: 0.1,
                                              onPress: () {},
                                              prefixIcon: Icons
                                                  .arrow_drop_down_rounded),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    CustomText(
                      txt: "Keuntungan Membayaran Iuran",
                      size: 0.04,
                      botpad: 0.04,
                      leftpad: 0.06,
                      toppad: 0.02,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: defaultPadding()),
                      child: ListView.builder(
                          shrinkWrap: true,
                          controller: scrollController,
                          padding: EdgeInsets.only(
                              bottom: getW(context, 0.016),
                              top: getW(context, 0.01)),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return PembayaranList();
                          }),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            right: getW(context, 0.06),
                            left: getW(context, 0.06)),
                        child: Container(
                          width: getW(context, 1),
                          height: getW(context, 0.2),
                          decoration: BoxDecoration(
                            color: Warna().accentColor(),
                            borderRadius:
                                BorderRadius.circular(getW(context, 0.02)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      spacingW(context, 0.04),
                                      CircleAvatar(
                                        radius: getW(context, 0.05),
                                        backgroundColor:
                                            Warna().backgroundColor(),
                                        child: Center(
                                          child: CircleAvatar(
                                            radius: getW(context, 0.05),
                                            backgroundColor: Colors.white70,
                                            child: Icon(Icons.groups_rounded,
                                                size: getW(context, 0.06),
                                                color: Warna().accentColor()),
                                          ),
                                        ),
                                      ),
                                      spacingW(context, 0.02),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CustomText(
                                                txt: "GoPay",
                                                bold: true,
                                                color:
                                                    Warna().backgroundColor(),
                                              ),
                                            ],
                                          ),
                                          CustomText(
                                              txt: "Pembayaran nontunai",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              color: Warna().backgroundColor()),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: getW(context, 0.02)),
                                      child: CustomButton(
                                        styleId: 2,
                                        onPress: () {},
                                        topMargin: 0.01,
                                        rightMargin: 0.01,
                                        leftMargin: 0.02,
                                        height: 0.07,
                                        suffixIcon: Icons.arrow_forward_ios,
                                        colorIcon: Warna().backgroundColor(),
                                        width: 0.07,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    spacingH(context, 0.02),
                    Expanded(
                        child: SingleChildScrollView(
                            child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          // decoration: BoxDecoration(
                          //   color: Warna().accentTransparentColor(),
                          //   borderRadius:
                          //       BorderRadius.circular(getW(context, 0.03)),
                          // ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  txt: "Yang sering ditanyakan",
                                  size: 0.04,
                                  bold: true,
                                  leftpad: 0.06,
                                  botpad: 0.04,
                                  toppad: 0.02,
                                ),
                                buttonFaq("Bagaimana cara kerja aplikasi?"),
                                buttonFaq("Bagaimana cara kerja aplikasi?"),
                                buttonFaq("Gabung Mitra Obatin?"),
                                buttonFaq("Cara Pembayaran?"),
                                buttonFaq("Bagaimana cara kerja aplikasi?"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))),
                  ],
                ),
              ),
            ),
          ]));
    });
  }

  buttonFaq(String txt) {
    return CustomButton(
      styleId: 5,
      leftMargin: 0.03,
      rightMargin: 0.04,
      suffixIcon: Icons.arrow_forward_ios,
      colorAccent: Warna().accentColor70(),
      text: txt,
    );
  }
}
