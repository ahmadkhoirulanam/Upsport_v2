// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/1_value/string_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

class KontenTextEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getW(context, 0.06), vertical: getW(context, 0.06)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            txt: "GOR UPGRIS Kampus 4",
            bold: true,
            size: 0.06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                txt: "129",
                rightpad: 0.05,
                prefixIcon: Icons.favorite,
                iconColor: Colors.red,
              ),
              CustomText(
                txt: "129",
                prefixIcon: Icons.chat_bubble_outline,
              )
            ],
          ),
          spacingH(context, 0.02),
          CustomText(
              txt:
                  "GOR UPGRIS atau kampus 4 Universitas PGRI Semarang ini diresmikan oleh Menteri Riset Teknologi dan Pendidikan Tinggi Prof. H. Mohamad Nasir, Ph.D.Ak. Sabtu 23 Janurai 2016 jam 13.30 wib bertempat Jalan Gajah Raya Semarang.\n\nGedung Olahraga ini terdiri dari lapangan futsal, basket indoor dan outdoor, bola voli indoor dan outdoor, tennis lapangan indoor dan outdoor, sepak takraw, bulutangkis indoor, serta tempat penyimpanan peralatan-peralatan olahraga seperti bola-bola, peralatan senam dan lain-lain. \n\nGedung Olahraga ini digunakan untuk perkuliahan mahasiswa PJKR baik di dalam gedung maupun di luar gedung olahraga. selain itu, GOR UPGRIS ini juga digunakan untuk berbagai acara atau kegiatan keolahragaan Universitas PGRI Semarang.")
        ],
      ),
    );
  }
}
