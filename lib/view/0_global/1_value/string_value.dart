import 'package:flutter/material.dart';

class StrGlobal {
  static lang<String>({@required String? ind, String? eng}) {
    return ind;
  }

  var namaApp = lang(ind: "UpSport App");
  var email = lang(ind: "Email");
  var password = lang(ind: "Kata Sandi", eng: "Password");
  var konfirmasiPassword =
      lang(ind: "Konfirmasi Kata Sandi", eng: "Confirm Password");
  var selanjutnya = lang(ind: "Selanjutnya", eng: "Next");
  var lewati = lang(ind: "Lewati", eng: "Skip");

  var loremipsumLong =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel \nLorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel";
}
