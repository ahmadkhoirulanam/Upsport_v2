import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/image_loader.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/B.%20Pelatih/widget/header_pelatih_futsal.dart';
import 'package:sport/view/B.%20Pelatih/widget/header_pelatih_senam.dart';
import 'package:url_launcher/link.dart';

class PelatihSenam extends StatefulWidget {
  final AnimationController? anim;
  const PelatihSenam({@required this.anim});
  @override
  _PelatihSenamState createState() => _PelatihSenamState();
}

class _PelatihSenamState extends State<PelatihSenam>
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
    'Harini,SPd',
    'Adik Priyo Utomo',
    'Danar Amelia.o',
    'Novita Novhee',
    'FIRLI TRI SETIOWATI',
    'Eni ekasari',
    'Ani setyowati',
    'Elva Rara',
    'Midah',
    'SRI UTAMI ',
    'Enung ',
    'ERA ARIVA MH',
    'M Fairuz',
    'Lily laili',
    'HALIMATUS SUDIYATI',
    'Nopha',
    'Suzie',
    'Diah Anggraeni',
    'Muyas',
    'Diah Suryaningrum'
  ];

  final List<String> emailList = [
    'llharini2@gmail.com',
    'adikpriyo@gmail.com',
    'DanarAmelia@gmail.com',
    'lkpnovhee@gmail.com',
    'trisetiowatifirli@gmail.com',
    'enijetri123@gmail.com',
    'Setyowatiani048@gmail.com',
    'isavera.elva307@gmail.com',
    'midahs412@gmail.com',
    'tami07075@gmail.com  ',
    'enungratih2205@gmail.com  ',
    'era.ariva@gmail.com',
    'Fairuzm048@gmail.com',
    'lily.technic@gmail.com',
    'titikhalim@gmail.com',
    'uutnopha@gmail.com',
    'Susihany55@gmail.com',
    'anggraenidiah965@gmail.com',
    'muyasgunawan@gmail.com',
    'diahauryaningrum6@gmail.com'
  ];
  final List<String> nowaList = [
    '+6287832105199',
    '+6285640693134',
    '+6281217587146',
    '+6285950678999',
    '+6283168102760',
    '+6287832260422',
    '+6283127763366',
    '+6287747804099',
    '+6285229348001',
    '+6287700014513',
    '+62895350410010',
    '+6283867429363',
    '+628998122184',
    '+6285864000900',
    '+6289526674577',
    '+6285742733722',
    '+6285700834128',
    '+6282241523855',
    '+6282220227289',
    '+6281901884246'
  ];
  final List<String> lisensiList = [
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik',
    'Senam Aerobik'
  ];
  final List<String> lokasiList = [
    'Kota Semarang',
    'Kota Semarang',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Purwokerto',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal'
  ];
  final List<String> clubiList = [
    'Alumni Astuti Studio',
    'Hans studio, Fik to Fit UNNES',
    'Nohvee',
    'Sanggar Senam LKP Novhee Kendal',
    'Nopha Studio',
    'club moms gemoy',
    'LKP novhee',
    'TRIPLE D Studio Senam',
    'Griya bugar ',
    'LKP NOVHEE KENDAL',
    'LKP Novhee Kendal / ASIAFI Kendal ',
    'Devila',
    'Aerodance Fairuz Community',
    'Lkp novhiee',
    'Sanggar senam novhe',
    'She studio by nopha',
    'Ss.Novhee',
    'LKP Novee Kendal',
    'LKP Novee Kendal',
    'LKP Novee Kendal',
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
                mainHeaderPelatihSenam(context, tweenValue: headerTween.value),
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
                  final email = emailList[index];
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
                            email: email,
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
  final String email;
  final String lokasi;
  final String club;
  final String lisensi;
  final String nowa;

  DetailPage(
      {required this.nama,
      required this.email,
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
                              Icons.sports_gymnastics_outlined,
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
                                txt: email,
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
                        txt: "Jenis Senam",
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
                        txt: "Nama Sanggar Senam/ Studio/ Club",
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
                                  'https://wa.me/$nowa?text=Hallo, Saya Membutuhkan Instruktur Senam'),
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
