// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/1_value/string_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_text.dart';

class KontenTextBerita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getW(context, 0.06), vertical: getW(context, 0.06)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            txt: "Prediksi Chelsea vs Fulham",
            bold: true,
            size: 0.05,
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
                  "Chelsea akan menjamu Fulham di Stamford Bridge pada pekan ke-22 Premier League 2022/2023. Pertandingan Liga Inggris antara Chelsea vs Fulham ini akan live Sabtu, 4 Februari 2023, jam 03:00 WIB.Hanya menang dua kali dalam 11 laga terakhirnya di Premier League, Chelsea kini tercecer di papan tengah. Tim polesan Graham Potter itu perlu meningkatkan kualitas permainan mereka jika ingin bangkit dari keterpurukan Chelsea telah bergerak sangat aktif di bursa transfer musim dingin.\n\nChelsea melepas Jorginho ke Arsenal, tetapi sudah mendatangkan sederet amunisi baru, seperti Joao Felix, Mykhailo Mudryk, Malo Gusto, dan Enzo Fernandez ke Stamford Bridge. Chelsea baru-baru ini telah bertemu dengan Fulham pada laga tunda pekan ke-7 di kandang lawan. Chelsea kalah 1-2. Fulham mencetak dua gol melalui Willian dan Carlos Vinicius, sedangkan Chelsea mencetak satu gol lewat Kalidou Koulibaly dan kehilangan Joao Felix yang dikartu merah di laga debutnya.")
        ],
      ),
    );
  }
}
