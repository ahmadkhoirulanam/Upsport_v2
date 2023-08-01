import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/image_loader.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/B.%20Pelatih/widget/header_pelatih_bulu.dart';
import 'package:sport/view/B.%20Pelatih/widget/header_pelatih_futsal.dart';
import 'package:url_launcher/link.dart';

class PelatihBulu extends StatefulWidget {
  final AnimationController? anim;
  const PelatihBulu({@required this.anim});
  @override
  _PelatihBuluState createState() => _PelatihBuluState();
}

class _PelatihBuluState extends State<PelatihBulu>
    with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';
  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  final List<String> namaList = [
    'Ahmad Muhaimin',
    'Tahron, M.pd',
    'Tomy Rully',
    'Heru Kasiyanto, S.Kom',
    'SUNTANA',
    'Nurman Budianto, S.Pd',
    'Hasan Kuswara',
    'Muhammad Nur Achdi Sisdiyantara',
    'Bagus trengginas'
  ];

  final List<String> nowaList = [
    '+6281901901456',
    '+628122854820',
    '+6281575474583',
    '-',
    '-',
    '+628996556263',
    '-',
    '-',
    '-'
  ];
  final List<String> lisensiList = [
    'Pelatih Provinsi',
    'Pelatih Daerah (Kota/Kabupaten), Provinsi, Nasional',
    'Pelatih Provinsi',
    'Pelatih Daerah (Kota/Kabupaten)',
    'Pelatih Internasional',
    'Pelatih Internasional',
    'Pelatih Internasional',
    'Pelatih Provinsi, Internasional',
    'Pelatih Daerah (Kota/Kabupaten)'
  ];
  final List<String> lokasiList = [
    'Kota Semarang',
    'Kota Semarang',
    'Kota Semarang',
    'Blora',
    'Kabupaten Pemalang ',
    'Kabupaten Pekalongan',
    'Kota Salatiga',
    'Kabupaten Rembang',
    'Kudus'
  ];
  final List<String> clubiList = [
    '-',
    'PB MATAHARI TERBIT Semarang ',
    'PB.Sehat',
    'PB. CEPU JUNIOR - BLORA',
    'Putra Mandiri',
    'Mutiara Pekalongan',
    'Pb. Pijar Salatiga',
    'PB.BMS Rembang',
    'Menara kudus '
  ];
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
                mainHeaderPelatihBulu(context, tweenValue: headerTween.value),
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
                    bottom: getW(context, 0.24), top: getW(context, 0.4)),
                itemCount: namaList.length,
                itemBuilder: (context, index) {
                  final nama = namaList[index];
                  final lokasi = lokasiList[index];
                  final lisensi = lisensiList[index];
                  final nowa = nowaList[index];
                  final club = clubiList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            nama: nama,
                            lokasi: lokasi,
                            club: club,
                            lisensi: lisensi,
                            nowa: nowa,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: getW(context, 0.025)),
                      padding:
                          EdgeInsets.symmetric(horizontal: getW(context, 0.04)),
                      height: getW(context, 0.25),
                      decoration: BoxDecoration(
                          color: Warna().buttonColor2Background(),
                          borderRadius:
                              BorderRadius.circular(getW(context, 0.03))),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: getW(context, 0.07),
                            backgroundColor: Warna().accentColor(),
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor:
                                    Warna().accentTransparentColor(aplha: 50),
                                radius: getW(context, 0.07),
                                child: ImgLoader.pelatih,
                              ),
                            ),
                          ),
                          spacingW(context, 0.02),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  txt: nama,
                                  bold: true,
                                ),
                                CustomText(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    size: 0.028,
                                    txt: lisensi),
                                spacingH(context, 0.01),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: getH(context, 0.02),
                                      color: Warna().accentColorCerah(),
                                    ),
                                    spacingW(context, 0.02),
                                    CustomText(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        size: 0.028,
                                        txt: lokasi),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.badge,
                                      size: getH(context, 0.02),
                                      color: Warna().accentColorCerah(),
                                    ),
                                    spacingW(context, 0.02),
                                    CustomText(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        size: 0.028,
                                        txt: club),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ].reversed.toList(),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String nama;
  final String lokasi;
  final String club;
  final String lisensi;
  final String nowa;

  DetailPage(
      {required this.nama,
      required this.lokasi,
      required this.club,
      required this.lisensi,
      required this.nowa});
  bool _hasCallSupport = false;
  Future<void>? _launched;
  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  String _phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
      ),
      body: Center(
        child: Stack(
          children: [
            WidgetTween(
              child: SizedBox(
                  height: getW(context, 0.6),
                  width: getW(context, 1),
                  child: ClipRRect(
                    child: ImgLoader.example1,
                  )),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: getW(context, 0.5)),
              child: Container(
                width: getW(context, 1),
                padding: EdgeInsets.symmetric(horizontal: defaultPadding()),
                decoration: BoxDecoration(
                    color: Warna().backgroundColor(),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(getW(context, 0.05)),
                        topRight: Radius.circular(getW(context, 0.05)))),
                child: WidgetTween(
                  y: -getW(context, 0.13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: getW(context, 0.15),
                            backgroundColor: Warna().backgroundColor(),
                            child: Padding(
                              padding: EdgeInsets.all(getW(context, 0.01)),
                              child: ImgLoader.pelatih,
                            ),
                          ),
                          // CustomButton(
                          //   onPress: () {},
                          //   height: 0.07,
                          //   botMargin: 0.03,
                          //   borderRadius: 0.03,
                          //   text: "Edit Profil",
                          // )
                        ],
                      ),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.sports_tennis_sharp,
                              color: Warna().accentColor(),
                              size: getW(context, 0.3),
                            ),
                          ),
                          Column(
                            children: [
                              CustomText(
                                align: Alignment.centerLeft,
                                txt: nama,
                                semibold: true,
                                size: 0.05,
                                toppad: 0.04,
                              ),
                              CustomText(
                                txt: "stephenwilliam@gmail.com",
                                prefixIcon: Icons.email_outlined,
                                iconSpacing: 0.06,
                                color: Warna().accentColor(),
                                iconColor: Warna().accentColor(),
                              ),
                              CustomText(
                                txt: lokasi,
                                prefixIcon: Icons.location_on_outlined,
                                iconSpacing: 0.06,
                                color: Warna().accentColor(),
                                iconColor: Warna().accentColor(),
                              ),
                              CustomText(
                                txt: "14 November 1998",
                                prefixIcon: Icons.date_range_outlined,
                                iconSpacing: 0.06,
                                color: Warna().accentColor(),
                                iconColor: Warna().accentColor(),
                              ),
                              Divider(
                                thickness: getW(context, 0.01),
                                color:
                                    Warna().accentTransparentColor(aplha: 15),
                              )
                            ],
                          )
                        ],
                      ),
                      CustomText(
                        txt: "Lisensi Pelatih",
                        semibold: true,
                        size: 0.035,
                        toppad: 0.03,
                        botpad: 0.02,
                      ),
                      CustomText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          size: 0.03,
                          txt: lisensi),
                      spacingH(context, 0.01),
                      CustomText(
                        txt: "Nama Club",
                        semibold: true,
                        size: 0.035,
                        toppad: 0.03,
                        botpad: 0.02,
                      ),
                      SizedBox(
                          height: getW(context, 0.3),
                          child: ListView.builder(
                              itemCount: 1,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: getW(context, 0.85),
                                  height: getW(context, 0.3),
                                  margin: EdgeInsets.only(
                                    left: index != 0 ? getW(context, 0.02) : 0,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Warna().accentColor(),
                                      borderRadius: BorderRadius.circular(
                                          getW(context, 0.05))),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        radius: getW(context, 0.07),
                                        backgroundColor: Colors.white12,
                                        child: Icon(
                                          Icons.badge,
                                          color: Colors.white,
                                          size: getW(context, 0.08),
                                        ),
                                      ),
                                      CustomText(
                                        txt: club,
                                        textAlign: TextAlign.center,
                                        semibold: true,
                                        size: 0.04,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                );
                              })),
                      Padding(
                        padding: EdgeInsets.only(
                            top: getW(context, 0.05),
                            bottom: getW(context, 0.03)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            spacingH(context, 0.01),
                            Link(
                              uri: Uri.parse(
                                  'https://wa.me/$nowa?text=Hallo, Saya Membutuhkan Pelatih'),
                              target: LinkTarget.blank,
                              builder:
                                  (BuildContext ctx, FollowLink? openLink) {
                                return CustomButton(
                                  onPress: openLink,
                                  text: "Hubungi",
                                  prefixIcon: Icons.phone,
                                  rightMargin: 0.03,
                                  height: 0.15,
                                );
                              },
                            ),
                            const Padding(padding: EdgeInsets.all(16.0)),
                            FutureBuilder<void>(
                                future: _launched, builder: _launchStatus),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
