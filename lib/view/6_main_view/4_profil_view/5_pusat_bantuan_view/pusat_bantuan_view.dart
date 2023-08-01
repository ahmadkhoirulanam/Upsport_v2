import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/controller/d_delay_function.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_textbutton.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_textfield.dart';
import 'package:sport/view/6_main_view/4_profil_view/3_riwayat_materi_view/widget/header_riwayat_materi.dart';
import 'package:sport/view/6_main_view/4_profil_view/5_pusat_bantuan_view/widget/header_pusatbantuan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BantuanPusatBantuan extends StatefulWidget {
  @override
  _BantuanPusatBantuanState createState() => _BantuanPusatBantuanState();
}

class _BantuanPusatBantuanState extends State<BantuanPusatBantuan>
    with TickerProviderStateMixin {
  late Animation<double> tween;
  late AnimationController anim;
  late Animation<double> headerTween;
  late AnimationController headerAnim;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    initial();
    initialValue();
    super.initState();
  }

  initialValue() {
    GlobalTweenAnimation.oneToZeroTween(context, this,
        setValue: (tween1, anim1) {
      tween = tween1;
      anim = anim1;
    }, timerFunc: () {
      anim.forward();
    });
  }

  initial() {
    GlobalTweenAnimation.zeroToOneTween(context, this,
        customDuration: const Duration(milliseconds: 300),
        customCurve: Curves.ease, setValue: (tween, anim) {
      headerTween = tween;
      headerAnim = anim;
    }, timerFunc: () {});
  }

  handleBack() {
    DelayFunction.delay200msClose(context, onBeforeClose: () {
      anim.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: WillPopScope(
        onWillPop: () => handleBack(),
        child: VisibilityDetector(
            key: Key("pusatbantuan"),
            onVisibilityChanged: (visible) {
              if (visible.visibleFraction == 1.0) {
                anim.forward();
              }
            },
            child: Scaffold(
              backgroundColor: Warna().backgroundColor(),
              body: Padding(
                padding: const EdgeInsets.only(top: 00),
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: headerAnim,
                      builder: (context, widgetState) => mainHeaderPusatBantuan(
                          context,
                          tweenValue: headerTween.value),
                    ),
                    NotificationListener<ScrollNotification>(
                      child: Padding(
                        padding: EdgeInsets.all(defaultPadding()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(
                              txt: "Selamat Datang di Pusat Bantuan",
                              size: 0.04,
                              color: Warna().accentColor70(),
                              semibold: true,
                              toppad: 0.17,
                            ),
                            CustomText(
                              txt: "Ada yang bisa kami bantu ?",
                              bold: true,
                              size: 0.05,
                              toppad: 0.02,
                              rightpad: 0.02,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5, top: 12),
                              child: CustomTextField(
                                styleId: 2,
                                height: 0.09,
                                hint2: "Masukan Kode Promo",
                                prefixIcon: Icons.search,
                              ),
                            ),
                            Expanded(
                                child: SingleChildScrollView(
                                    child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Warna().accentTransparentColor(),
                                    borderRadius: BorderRadius.circular(
                                        getW(context, 0.03)),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          txt: "Yang sering ditanyakan",
                                          size: 0.04,
                                          bold: true,
                                          leftpad: 0.02,
                                          botpad: 0.04,
                                          toppad: 0.02,
                                        ),
                                        buttonFaq(
                                            "Bagaimana cara kerja aplikasi?"),
                                        buttonFaq(
                                            "Bagaimana cara kerja aplikasi?"),
                                        buttonFaq("Gabung Mitra Obatin?"),
                                        buttonFaq("Cara Pembayaran?"),
                                        buttonFaq(
                                            "Bagaimana cara kerja aplikasi?"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ))),
                            spacingH(context, 0.02),
                            CustomText(
                              txt: "Pilih topik sesuai kendaa kamu",
                              overflow: TextOverflow.ellipsis,
                              semibold: true,
                              fontId: 2,
                              leftpad: 0.02,
                              toppad: 0.02,
                              rightpad: 0.02,
                            ),
                            GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 4,
                              shrinkWrap: true,
                              childAspectRatio: 1,
                              mainAxisSpacing: getW(context, 0.02),
                              children: [
                                buttonTopic("Akun"),
                                buttonTopic("Pesanan"),
                                buttonTopic("Pembayaran"),
                                buttonTopic("Pengiriman"),
                                buttonTopic("Komplain"),
                                buttonTopic("Promosi"),
                                buttonTopic("Menu\nOBAT-in"),
                                buttonTopic("Syarat &\nKetentuan"),
                              ],
                            ),
                            spacingH(context, 0.03),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(txt: "Kami siap membantu anda"),
                                CustomText(
                                    textAlign: TextAlign.center,
                                    color: Warna().accentColor70(),
                                    txt:
                                        "Tim Pusat Bantuan blumb akan selalu siap untuk membantu kendala anda kapanpum"),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  buttonTopic(String txt) {
    return Padding(
        padding: EdgeInsets.only(
          left: getW(context, 0.02),
          right: getW(context, 0.02),
        ),
        child: Container(
          width: getW(context, 0.4),
          height: getW(context, 0.09),
          decoration: BoxDecoration(
            color: Warna().accentColor(),
            borderRadius: BorderRadius.circular(getW(context, 0.03)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person,
                  size: getW(context, 0.06), color: Warna().backgroundColor()),
              CustomTextButton(
                toppad: 0.02,
                textAlign: TextAlign.center,
                txt: txt,
                fontId: 1,
                size: 0.03,
                color: Warna().backgroundColor(),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }

  buttonFaq(String txt) {
    return CustomButton(
      styleId: 5,

      colorAccent: Warna().accentColor70(),
      // onPressed: () {
      //   anim.reverse();
      //   DelayFunction.delay200msFunction(context, onAfterDelay: () {
      //     goToPage(context,
      //         page: BantuanFAQ(
      //           title: txt,
      //         ));
      //   });
      // },
      text: txt,
    );
  }
}
