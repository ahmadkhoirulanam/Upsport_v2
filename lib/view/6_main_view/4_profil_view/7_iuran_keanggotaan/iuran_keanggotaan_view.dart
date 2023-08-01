// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, missing_required_param
import 'package:sport/controller/0_bloc/system_bloc/system_bloc.dart';
import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/2_widget/image_loader.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:sport/view/6_main_view/4_profil_view/7_iuran_keanggotaan/widget/header_iuran.dart';
import 'package:sport/view/6_main_view/5_user_view/widget/organisasi_diikuti.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Iuran_keanggotaan_View extends StatefulWidget {
  final VoidCallback? onMoreClick;
  Iuran_keanggotaan_View({@required this.onMoreClick});
  @override
  _Iuran_keanggotaan_ViewState createState() => _Iuran_keanggotaan_ViewState();
}

class _Iuran_keanggotaan_ViewState extends State<Iuran_keanggotaan_View>
    with TickerProviderStateMixin {
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
                builder: (context, widgetState) =>
                    mainHeaderIuran(context, tweenValue: headerTween.value)),
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
                    bottom: getW(context, 0.25), top: getW(context, 0.45)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: defaultPadding(),
                          right: defaultPadding(),
                          top: getW(context, 0.03)),
                      child: Column(
                        children: [
                          SizedBox(
                              height: getW(context, 0.27),
                              width: getW(context, 1),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.all(getW(context, 0.01)),
                                    child: SizedBox(
                                        height: getW(context, 0.8),
                                        width: getW(context, 1),
                                        child: Stack(
                                          children: [
                                            SizedBox(
                                              height: getW(context, 0.9),
                                              width: getW(context, 1),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getW(context, 0.02)),
                                                child: (ImgLoader.example8),
                                              ),
                                            ),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  children: [
                                                    CustomButton(
                                                      styleId: 2,
                                                      onPress: () {},
                                                      colorAccent:
                                                          Colors.white70,
                                                      topMargin: 0.01,
                                                      rightMargin: 0.01,
                                                      leftMargin: 0.06,
                                                      height: 0.17,
                                                      width: 0.17,
                                                    ),
                                                    spacingW(context, 0.03),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CustomText(
                                                          txt: "Anam Khoirul",
                                                          color: Colors.white70,
                                                          bold: true,
                                                        ),
                                                        CustomText(
                                                          txt:
                                                              "20 Agustus 2022",
                                                          color: Colors.white70,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CustomText(
                                                              txt:
                                                                  "Detail Iuran",
                                                              bold: true,
                                                              color: Colors
                                                                  .white70,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .arrow_forward_ios_sharp,
                                                              color:
                                                                  Colors.white,
                                                              size: getW(
                                                                  context,
                                                                  0.03),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ))
                                          ],
                                        )),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    spacingH(context, 0.05),
                    Padding(
                      padding: EdgeInsets.only(
                          left: defaultPadding(), right: defaultPadding()),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Warna().accentTransparentColor(),
                          borderRadius:
                              BorderRadius.circular(getW(context, 0.03)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomText(
                                txt: "Keuntungan Membayaran Iuran",
                                size: 0.04,
                                bold: true,
                                botpad: 0.04,
                                leftpad: 0.04,
                                toppad: 0.02,
                              ),
                              keuntungan_iuran(
                                title: "Ikut Event Tanpa Batasan",
                                title2: "Nikmati ikut event sepuasnya",
                                icon: Icons.event_available_sharp,
                              ),
                              keuntungan_iuran(
                                  title: "Bebas Iklan",
                                  title2: "Nikmati layanan tanpa gangguan",
                                  icon: Icons.free_cancellation_sharp),
                              keuntungan_iuran(
                                  title: "Dikson Untuk Event Berbayar",
                                  title2: "berkesempatan diskon hingga 100%",
                                  icon: Icons.discount_rounded),
                              keuntungan_iuran(
                                  title: "Interaksi Antar Anggota",
                                  title2: "Dapat Interaksi antar anggota",
                                  icon: Icons.discount_rounded),
                            ],
                          ),
                        ),
                      ),
                    ),
                    spacingH(context, 0.01),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: getW(context, 0.05), left: 26),
                      child: OrganisasiDiikuti(),
                    ),
                    spacingH(context, 0.02),
                    Padding(
                      padding: EdgeInsets.only(
                          left: defaultPadding(), right: defaultPadding()),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Warna().accentTransparentColor(),
                          borderRadius:
                              BorderRadius.circular(getW(context, 0.03)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                txt: "Bayar Iuran Rp. 35.000",
                                size: 0.04,
                                bold: true,
                                botpad: 0.04,
                                leftpad: 0.04,
                                toppad: 0.04,
                              ),
                              CustomButton(
                                text: "Bayar Sekarang",
                                onPress: () {},
                                topMargin: 0.03,
                                height: 0.08,
                                rightMargin: 0.02,
                                width: 0.33,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      onPress: () {},
                      botMargin: 0.04,
                      text: "Butuh Bantuan ?",
                      styleId: 2,
                    ),
                  ],
                ),
              ),
            ),
          ]));
    });
  }

  keuntungan_iuran({
    Widget? gotopage,
    VoidCallback? function,
    @required String? title,
    String? title2,
    @required IconData? icon,
  }) {
    return Padding(
      padding: EdgeInsets.only(
          left: 20,
          right: defaultPadding(),
          top: getW(context, 0.02),
          bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                txt: title,
                color: Warna().fontColor1(),
                fontId: 2,
              ),
              CustomText(
                txt: title2,
                color: Colors.grey,
              ),
            ],
          ),
          CustomButton(
            styleId: 2,
            onPress: () {},
            colorAccent: Warna().accentColor(),
            topMargin: 0.01,
            rightMargin: 0.01,
            height: 0.08,
            prefixIcon: icon,
            colorIcon: Colors.white,
            width: 0.08,
          )
        ],
      ),
    );
  }
}
