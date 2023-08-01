import 'package:sport/controller/b_shared_prefs.dart';
import 'package:sport/view/0_global/1_value/variable.dart';

class InitialController {
  static void load() {
    SharedPrefs.switchModeTema(navKey.currentContext!, fungsi: "get");
  }
}
