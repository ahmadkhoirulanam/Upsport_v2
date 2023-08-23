// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';

class ImgLoader {
  //General String
  static setImg(var imgName, {BoxFit? fit}) {
    var imageDir = "assets/img/";
    return Image.asset(
      imageDir + imgName,
      fit: fit != null ? fit : null,
    );
  }

  static setImgAvatar(var imgName) {
    var imageDir = "assets/img/avatar/$imgName.jpg";
    return Image.asset(
      imageDir,
      gaplessPlayback: true,
      filterQuality: FilterQuality.medium,
      fit: BoxFit.scaleDown,
    );
  }

  static setImgExample(var imgName) {
    var imageDir = "assets/img/example_content/";
    return Image.asset(
      imageDir + imgName,
      gaplessPlayback: true,
      filterQuality: FilterQuality.low,
      fit: BoxFit.cover,
    );
  }

  static setImgSplash(var imgName) {
    var imageDir = "assets/img/";
    return Image.asset(imageDir + imgName);
  }

  static setImgFitFill(var imgName) {
    var imageDir = "assets/img/";
    return Image.asset(
      imageDir + imgName,
      fit: BoxFit.cover,
    );
  }

  static setImgFitur(var imgName) {
    var imageDir = "assets/img/fitur/";
    return Image.asset(imageDir + imgName);
  }

  static var logoApp = setImgFitFill("logo_app.png");
  static var intro1 = setImg("intro_1.png");
  static var intro2 = setImg("intro_2.png");
  static var intro3 = setImg("intro_3.png");
  static var otpheader = setImg("otp_header.png");
  static var exampleMap = setImg("map.png", fit: BoxFit.cover);
  static var example1 = setImgExample("example1.jpg");
  static var example2 = setImgExample("example2.jpg");
  static var example3 = setImgExample("example3.jpg");
  static var example4 = setImgExample("example4.jpg");
  static var example5 = setImgExample("example5.jpg");
  static var examplePhoto1 = setImgExample("examplephoto1.jpg");
  static var examplePhoto1mini = setImgExample("examplephoto1mini.png");
  static var pelatih = setImgExample("pelatih.png");
  static var fiturAgenda = setImgFitur("lap.png");
  static var fiturIuran = setImgFitur("lain.png");
  static var fiturMateri = setImgFitur("person.png");
  static var fiturPromo = setImgFitur("news.png");
  static var fiturSertifikat = setImgFitur("pelatih.png");
  static var fiturUndangan = setImgFitur("sport.png");
  static var fiturVirtualCV = setImgFitur("wasit.png");
  static var fiturEvents = setImgFitur("message.png");
  static var fiturLainnya = setImgFitur("icon_lainnya.png");
  static var ktpOverlay = setImg("ktpoverlay.png", fit: BoxFit.cover);
  static var futsal = setImgFitur("futsal.png");
  static var basket = setImgFitur("baket.png");
  static var sepak = setImgFitur("sepak.png");
  static var tenis = setImgFitur("tenis.png");
  static var senam = setImgFitur("senam.png");
  static var pimpong = setImgFitur("pimpong.png");
  static var bulu = setImgFitur("bulu.png");
  static var ktpSelfieOverlay =
      setImg("ktpselfieoverlay.png", fit: BoxFit.cover);

  //Avatar
  static Widget avatarLoad(int? avatarId) {
    return setImgAvatar(avatarId.toString());
  }
}
