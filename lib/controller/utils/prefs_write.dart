import 'package:get_storage/get_storage.dart';

final _storage = GetStorage();

class PrefsWrite {
  static Future disableIntroScreen({bool? disable}) async {
    return await _storage.write("disableIntroScreen", disable ?? true);
  }

  static Future themeId(int? themeId) async {
    return await _storage.write("themeId", themeId);
  }

  static Future languageId(int? languageId) async {
    return await _storage.write("languageId", languageId);
  }

  static Future statusAnimasi(bool? status) async {
    return await _storage.write("statusAnimasi", status);
  }

  static Future alreadyLogin(bool? status) async {
    return await _storage.write("alreadyLogin", status);
  }
}
