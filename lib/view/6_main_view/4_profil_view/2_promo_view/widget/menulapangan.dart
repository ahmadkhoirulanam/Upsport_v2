import 'package:sport/controller/6_main_controller/1_beranda_controller/func_homeview.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/image_loader.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';

MenuLapangan(BuildContext context, {@required AnimationController? anim}) {
  button(
      {@required VoidCallback? onPress,
      @required String? title,
      @required Widget? image,
      IconData? icon}) {
    return CustomButton(
      onPress: () {
        onPress!();
      },
      text: title!,
      styleId: 6,
      prefixWidget: Container(
        margin: EdgeInsets.only(bottom: getW(context, 0.01)),
        width: getW(context, 0.23),
        height: getW(context, 0.23),
        child: image!,
      ),
      verticalAlign: true,
      iconSize: 0.18,
      colorIcon: Warna().accentColor70(),
      // prefixIcon: Icons.add_box_outlined,
    );
  }

  goToFutsal() => FuncHomeView.goToFutsal(context, anim: anim);
  goToLapBasket() => FuncHomeView.goToLapBasket(context, anim: anim);
  goToLapBola() => FuncHomeView.goToLapBola(context, anim: anim);
  goToLaptenis() => FuncHomeView.goToLaptenis(context, anim: anim);
  goToLapbulu() => FuncHomeView.goToLapbulu(context, anim: anim);
  goToLappimpong() => FuncHomeView.goToLappimpong(context, anim: anim);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: getW(context, 0.01)),
    child: GridView.count(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      children: [
        button(
            image: ImgLoader.futsal,
            onPress: () => goToFutsal(),
            title: "Futsal"),
        button(
            image: ImgLoader.basket,
            onPress: () => goToLapBasket(),
            title: "Basket"),
        button(
            image: ImgLoader.sepak,
            onPress: () => goToLapBola(),
            title: "Sepak Bola"),
        button(
            image: ImgLoader.tenis,
            onPress: () => goToLaptenis(),
            title: "Teniis"),
        button(
            image: ImgLoader.bulu,
            onPress: () => goToLapbulu(),
            title: "Bulu Tangkis"),
        button(
            image: ImgLoader.pimpong,
            onPress: () => goToLappimpong(),
            title: "Tenis Meja"),
      ],
    ),
  );
}
