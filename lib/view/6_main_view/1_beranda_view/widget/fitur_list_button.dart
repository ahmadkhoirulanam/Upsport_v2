import 'package:sport/controller/6_main_controller/1_beranda_controller/func_homeview.dart';
import 'package:flutter/material.dart';
import 'package:sport/view/0_global/1_value/color_value.dart';
import 'package:sport/view/0_global/1_value/image_loader.dart';
import 'package:sport/view/0_global/1_value/size_value.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_bottom_dialog.dart';
import 'package:sport/view/0_global/3_custom_widget/custom_button.dart';

fiturListButton(BuildContext context, {@required AnimationController? anim}) {
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
        width: getW(context, 0.15),
        height: getW(context, 0.15),
        child: image!,
      ),
      verticalAlign: true,
      iconSize: 0.18,
      colorIcon: Warna().accentColor70(),
      // prefixIcon: Icons.add_box_outlined,
    );
  }

  goToAgenda() => FuncHomeView.goToAgenda(context, anim: anim);
  goToPelatih() => FuncHomeView.goToPelatih(context, anim: anim);
  goToWasit() => FuncHomeView.goToWasit(context, anim: anim);
  goToMessage() => FuncHomeView.goToMessage(context, anim: anim);
  goToProfile() => FuncHomeView.goToProfile(context, anim: anim);
  goToToko() => FuncHomeView.goToToko(context, anim: anim);

  return Container(
    padding: EdgeInsets.symmetric(horizontal: getW(context, 0.01)),
    child: GridView.count(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      children: [
        button(
            image: ImgLoader.fiturAgenda,
            onPress: () => goToAgenda(),
            title: "Lapangan"),
        button(
            image: ImgLoader.fiturSertifikat,
            onPress: () => goToPelatih(),
            title: "Pelatih"),
        button(
            image: ImgLoader.fiturVirtualCV,
            onPress: () => goToWasit(),
            title: "Wasit"),
        button(
            image: ImgLoader.fiturEvents,
            onPress: () => goToMessage(),
            title: "Massage"),
        button(
            image: ImgLoader.fiturUndangan,
            onPress: () => goToToko(),
            title: "Toko Olahraga"),
        button(
            image: ImgLoader.fiturPromo,
            onPress: () => CustomBottomDialog(txt: "On Proses"),
            title: "Sport News"),
        button(
            image: ImgLoader.fiturMateri,
            onPress: () => goToProfile(),
            title: "Profil"),
        button(
            image: ImgLoader.fiturIuran,
            onPress: () => CustomBottomDialog(txt: "On Proses"),
            title: "Lainnya"),
      ],
    ),
  );
}
