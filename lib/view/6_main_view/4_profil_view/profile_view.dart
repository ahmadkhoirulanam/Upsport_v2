// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, missing_required_param

import 'package:sport/controller/0_bloc/system_bloc/system_bloc.dart';
import 'package:sport/controller/c_global_tween_animation.dart';
import 'package:sport/controller/d_delay_function.dart';
import 'package:sport/controller/get_bahasa_id.dart';
import 'package:sport/view/0_global/1_value/variable.dart';
import 'package:sport/view/6_main_view/1_beranda_view/3_agenda_detail_view/agenda_detail_view.dart';
import 'package:sport/view/6_main_view/4_profil_view/2_promo_view/promo_view.dart';
import 'package:sport/view/6_main_view/4_profil_view/3_riwayat_materi_view/riwayat_materi_view.dart';
import 'package:sport/view/6_main_view/4_profil_view/4_kumpulan_sertifikat_view/lapanganfutsal.dart';
import 'package:sport/view/6_main_view/4_profil_view/5_pusat_bantuan_view/pusat_bantuan_view.dart';
import 'package:sport/view/6_main_view/4_profil_view/6_pengaturan_aplikasi/pengaturan_aplikasi_view.dart';
import 'package:sport/view/6_main_view/4_profil_view/7_iuran_keanggotaan/iuran_keanggotaan_view.dart';
import 'package:sport/view/6_main_view/4_profil_view/8_pembayaran_view/pembayaran_view.dart';
import 'package:sport/view/6_main_view/4_profil_view/widget/header_profile.dart';
import 'package:sport/view/6_main_view/4_profil_view/widget/organisasi_card.dart';
import 'package:sport/view/B.%20Pelatih/widget/pelatihfutsal.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../0_global/1_value/transition_value.dart';

part 'string.dart';

class ProfileView extends StatefulWidget {
  final VoidCallback? onMoreClick;
  ProfileView({@required this.onMoreClick});
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
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
          body: Stack(
            children: [
              AnimatedBuilder(
                animation: headerAnim,
                builder: (context, widgetState) => mainHeaderProfile(context,
                    tweenValue: headerTween.value,
                    onMoreClick: widget.onMoreClick),
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
                      bottom: getW(context, 0.25), top: getW(context, 0.3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          OrganisasiCard(),
                          OrganisasiCard(
                            tombolTambah: true,
                            index: 1,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: defaultPadding(),
                            right: defaultPadding(),
                            top: getW(context, 0.08)),
                        child: Column(
                          children: [
                            buttonStyle(
                                gotopage: PelatihFutsal(),
                                text: _manajemen_akun,
                                icon: Icons.person_outline),
                            buttonStyle(
                                gotopage: Promo(),
                                text: _promoBerlaku,
                                icon: Icons.verified_outlined),
                            buttonStyle(
                                gotopage: RiwayatMateri(),
                                text: _riwayatMateri,
                                icon: Icons.history),
                            buttonStyle(
                                gotopage: lapanganfutsal(),
                                text: _kumpulanSertifikat,
                                icon: Icons.checklist_rtl_sharp),
                            buttonStyle(
                                gotopage: Pembayaran(),
                                text: _pembayaran,
                                icon: Icons.wallet_membership),
                            buttonStyle(
                                gotopage: Iuran_keanggotaan_View(),
                                text: _iuranKeanggotaan,
                                icon: Icons.credit_card),
                            buttonStyle(
                                gotopage: PengaturanApp(),
                                text: _pengaturanAplikasi,
                                icon: Icons.settings_outlined),
                            buttonStyle(
                                gotopage: BantuanPusatBantuan(),
                                text: _pusatBantuan,
                                icon: Icons.info_outline),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ].reversed.toList(),
          ));
    });
  }

  buttonStyle(
      {Widget? gotopage,
      VoidCallback? function,
      @required String? text,
      @required IconData? icon}) {
    return CustomButton(
      onPress: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => TambahOrganisasi()),
        // );
        if (gotopage != null) {
          DelayFunction.delay200msFunction(context, onAfterDelay: () {
            goToPage(context, page: gotopage);
          });
        } else {
          if (function != null) {
            function();
          }
        }
      },
      prefixIcon: icon,
      styleId: 5,
      text: text,
    );
  }
}
