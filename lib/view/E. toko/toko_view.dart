// ignore_for_file: use_key_in_widget_constructors

import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:sport/view/6_main_view/4_profil_view/3_riwayat_materi_view/widget/header_lapangan_basket.dart';
import 'package:sport/view/B.%20Pelatih/widget/header_pelatih_futsal.dart';
import 'package:sport/view/6_main_view/4_profil_view/3_riwayat_materi_view/widget/header_riwayat_materi.dart';
import 'package:sport/view/6_main_view/4_profil_view/4_kumpulan_sertifikat_view/widget/lap_basket_card.dart';
import 'package:sport/view/6_main_view/4_profil_view/4_kumpulan_sertifikat_view/widget/serifikat_card.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/B.%20Pelatih/widget/pelatih_futsal_card_list.dart';
import 'package:sport/view/D.%20Message/widget/header_message.dart';
import 'package:sport/view/D.%20Message/widget/message_card_list.dart';
import 'package:sport/view/E.%20toko/widget/header_toko.dart';

class Toko_view extends StatefulWidget {
  final AnimationController? anim;
  const Toko_view({@required this.anim});
  @override
  _Toko_viewState createState() => _Toko_viewState();
}

class _Toko_viewState extends State<Toko_view> with TickerProviderStateMixin {
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
                mainHeaderToko(context, tweenValue: headerTween.value),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getH(context, 0.2),
                left: getW(context, 0.05),
                right: getW(context, 0.05)),
            child: GridView.count(
              //widget yang akan ditampilkan dalam 1 baris adalah 2
              crossAxisCount: 2,
              children: [
                //card ditampilkan disini
                //saya membuat custom card di bawah agar kodingan tidak terlalu panjang
                CustomCard(
                    title: "Helm Sepeda",
                    image:
                        "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRVS23OPEJes1Ml-K9fMKcOq3Ctk_BX47lEfbFH1hc9vspF2W0FOe5Siz_NkQzSceGaMf9NATGI94_VTBcdtZZX2Qafm7nXw2_Pe9Rdxzl1LIvhI5pLEsBm&usqp=CAEg"),
                CustomCard(
                    title: "Jerse Futsal",
                    image:
                        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR55WQVBbnMXJ2vFKRp-0CxslXf_cBDALOsAcX0mZjMuPUrSpcRSQkRdM1HZsl12OS9CACoPnwhBmRy_xx7WrfykuIqGXIpReYo1lhyccfD&usqp=CAE"),

                CustomCard(
                    title: "barbel 100 Kg",
                    image:
                        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSN_vT9-umJE1iDWO4CMnFk0ddVf3_RviS82PslQFN4vKGM3FmWSbLdXn8Uw5F8be2tz0yMjXMke-NyqpdNUG9yEdqhe701TtDsoG8qA0PAbyjlRn-MLgtn&usqp=CAE"),
                CustomCard(
                    title: "Raket Set 2",
                    image:
                        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSHTblEI_5JyLHMk5Pf-sa4sRUrLoNO1OIGZ-FKvD_yhA2u7iFQe0lLt0ygs_D5gIodlydmX-YUUBpB6ccF8ktjuoWkNwXAjehe7w1gnMn2jYe1GlbJGdIA&usqp=CAE"),
                CustomCard(
                    title: "Sepatu Bola",
                    image:
                        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS-_uYxlmIKvjhB1oQIAac7XszwewZC-oaiNSSm81gFPjSP49HiATKPYWO8nNJExdJe7iijtv9Dyw7F34TIv6PtkBFDVbaYKZnvUEempE89pOztagkUAjHFSiI&usqp=CAE"),
                CustomCard(
                    title: "Sepatu Olahraga",
                    image:
                        "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcS1o39xZJXJgMR2ThHzoovU206vak89oVtrlnowCJMaVXOuERmdsYeTY9qFWznoi2irnqAQSpAtSN9PbAvrU25cv_0qCLT1gC00F4iclU1d-WIXZ2pO99Ki&usqp=CAE"),
                CustomCard(
                    title: "Sepatu Lari",
                    image:
                        "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSrrCLW7ON-PThopSE6l8PnG314i4apha4AfQnoMd1moPaZ68-fH3qlQZrbAHUu8Y6JowB7H7SA7hT3fyoPpXj6m69pn4YOrVpZFzZjAuX-JZBGXceVfJY&usqp=CAE"),
                CustomCard(
                    title: "bola Basket",
                    image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGKoeecsd2sAIejLVmgzOtXJ4iIbFcT4BqBg&usqp=CAU"),
              ],
            ),
          ),
        ].reversed.toList(),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  //ini adalah konstruktor, saat class dipanggil parameter konstruktor wajib diisi
  //parameter ini akan mengisi title dan gambar pada setiap card
  CustomCard({required this.title, required this.image});

  String title;
  String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        //menambahkan bayangan
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        image,
                      ),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  CustomText(
                    txt: title,
                    textAlign: TextAlign.left,
                    align: Alignment.centerLeft,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    semibold: true,
                    fontId: 2,
                    leftpad: 0.02,
                    rightpad: 0.02,
                  ),
                  CustomText(
                    txt: "Rp. 20.000",
                    textAlign: TextAlign.left,
                    align: Alignment.centerLeft,
                    maxLines: 2,
                    leftpad: 0.02,
                    rightpad: 0.02,
                    size: 0.03,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
