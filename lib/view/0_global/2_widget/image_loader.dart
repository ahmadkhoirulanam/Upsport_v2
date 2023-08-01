import 'package:flutter/material.dart';

class ImgLoader {
  //General String
  static setImg(var imgName) {
    var imageDir = "assets/img/";
    return Image.asset(
      imageDir + imgName,
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

  static var logoApp = setImgFitFill("up.png");
  static var intro1 = setImg("lap.png");
  static var intro2 = setImg("bulu.png");
  static var intro3 = setImg("tenis.png");
  static var otpheader = setImg("otp_header.png");
  static var example1 = setImgExample("example1.jpg");
  static var example2 = setImgExample("example2.jpg");
  static var example3 = setImgExample("example3.jpg");
  static var example4 = setImgExample("example4.jpg");
  static var example5 = setImgExample("example5.jpg");
  static var example6 = setImgExample("sertifikat.png");
  static var example7 = setImgExample("promo1.png");
  static var example8 = setImgExample("sampul.png");
  static var berita1 = setImgExample("bola1.jpeg");
  static var fitur1 = setImgExample("gorup.jpg");
  static var fiturAgenda = setImgExample("icon_agenda.png");
  static var fiturIuran = setImgExample("icon_iuran.png");
  static var fiturMateri = setImgExample("icon_materi.png");
  static var fiturPromo = setImgExample("icon_promo.png");
  static var fiturSertifikat = setImgExample("icon_sertifikat.png");
  static var fiturUndangan = setImgExample("icon_undangan.png");
  static var fiturVirtualCV = setImgExample("icon_virtualcv.png");
  static var fiturEvents = setImgExample("icon_events.png");
  static var fiturLainnya = setImgExample("icon_lainnya.png");
  static var examplePhoto1 = setImgExample("examplephoto1.jpg");
  static var examplePhoto1mini = setImgExample("examplephoto1mini.png");
}
