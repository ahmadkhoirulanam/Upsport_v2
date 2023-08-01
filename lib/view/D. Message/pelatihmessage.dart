import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/image_loader.dart';
import 'package:sport/view/0_global/2_widget/widget_transition.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/B.%20Pelatih/widget/header_pelatih_pimpong.dart';
import 'package:sport/view/D.%20Message/widget/header_message.dart';
import 'package:url_launcher/link.dart';

class Message_view extends StatefulWidget {
  final AnimationController? anim;
  const Message_view({@required this.anim});
  @override
  _Message_viewState createState() => _Message_viewState();
}

class _Message_viewState extends State<Message_view>
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
    'Adik Priyo utomo',
    'Deni lantasi',
    'Muhamad Anasikin, S. Si',
    'Heri Siswanto',
    'Miftakhul Zulfi',
    'Matrik sulton andara',
    'Faris masseur',
    'Yudha Permana',
    'Mohammad Sony Hendrawani',
    'Faris masseur',
    'Rian Nuari Erman. S.Kom, Aifmo',
    'Rojikin',
    'Muhammad Muhibbi',
    'Fahmi Iqbaldi, S.Pd',
    'Abdul Jabbar Amar'
  ];

  final List<String> nowaList = [
    '+6285640693134',
    '+6285600767619',
    '+6285882055861',
    '+6289662085818',
    '+62895336669697',
    '+6281575710514',
    '+6282218932818',
    '+6285793924030',
    '+6281325726770',
    '+6282218932818',
    '+6281368080962',
    '+6281372671215',
    '+6285799831333',
    '+6285640523449',
    '+6285591194436'
  ];

  final List<String> lisensiList = [
    'Sport massage',
    'Tradisional massage',
    'Sport massage, Segment massage',
    'Sport massage',
    'Sport massage',
    'Sport massage',
    'Sport massage, Thai massage, Tradisional massage, Segment massage',
    'Sport massage, Thai massage, Tradisional massage, Segment massage',
    'Sport massage, Segment massage',
    'Sport massage, Thai massage, Tradisional massage, Segment massage',
    'Sport massage, Segment massage',
    'Sport massage',
    'Sport massage, Thai massage, Tradisional massage, Segment massage, Swedish massage',
    'Sport massage, Thai massage, Tradisional massage, Segment massage, Swedish massage',
    'Sport massage'
  ];

  final List<String> lokasiList = [
    'Kota Semarang',
    'Kota Semarang',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kabupaten Kendal',
    'Kota Semarang, dan sekitarnya',
    'kota bandung',
    'Kota Sukabumi',
    'Pekalongan',
    'kota bandung',
    'Jakarta timur ',
    'Jakarta timur',
    'Kota Semarang',
    'Kabupaten Pekalongan ',
    'Jakarta Timur'
  ];
  final List<String> clubiList = [
    'adikpriyo@gmail.com',
    'lantasideni@gmail.com',
    'Bojamassage@gmail.com',
    'heri.aura1103@gmail.com',
    'zulfimiftakhul@gmail.com',
    'Matrikandara@gmail.com',
    'farismasseur@gmail.com',
    'Permana.adhoey@gmail.com',
    'msonyhen@gmail.com',
    'farismasseur@gmail.com',
    'riannuarierman@gmail.com',
    'rozcadle@gmail.com',
    'muhibbi@unimus.ac.id',
    'fahmiguru@gmail.com ',
    'jabbars.bellz@gmail.com'
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
                mainHeaderMessage(context, tweenValue: headerTween.value),
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
                                      Icons.mail,
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
                                txt: club,
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
                        txt: "Jenis Massage",
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
                        txt: "Email",
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
                                  'https://wa.me/$nowa?text=Hallo, Saya Membutuhkan Massage'),
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
