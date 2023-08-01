import 'dart:io' show Platform;

class PlatformType {
  static getType() {
    if (Platform.isAndroid) {
      return "android";
    } else if (Platform.isIOS) {
      return "ios";
    }
  }
}
