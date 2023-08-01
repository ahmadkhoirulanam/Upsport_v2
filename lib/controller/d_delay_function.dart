import 'dart:async';

import 'package:flutter/material.dart';

class DelayFunction {
  static void delay400msClose(BuildContext context,
      {@required VoidCallback? onBeforeClose}) {
    Timer? _timer;
    onBeforeClose!();
    _timer = Timer(const Duration(milliseconds: 400), () {
      _timer!.cancel();
      Navigator.pop(context);
    });
  }

  static void delay200msClose(BuildContext context,
      {@required VoidCallback? onBeforeClose}) {
    Timer? _timer;
    onBeforeClose!();
    _timer = Timer(const Duration(milliseconds: 220), () {
      _timer!.cancel();
      Navigator.pop(context);
    });
  }

  static void delayFunction(BuildContext context,
      {@required VoidCallback? onAfterDelay,
      @required int? durationMillisec,
      VoidCallback? onBeforeDelay}) {
    if (onBeforeDelay != null) onBeforeDelay();
    Timer? _timer;
    _timer = Timer(Duration(milliseconds: durationMillisec ?? 300), () {
      onAfterDelay!();
      _timer!.cancel();
    });
  }

  static void delay200msFunction(BuildContext context,
      {@required VoidCallback? onAfterDelay, VoidCallback? onBeforeDelay}) {
    if (onBeforeDelay != null) onBeforeDelay();
    Timer? _timer;
    _timer = Timer(const Duration(milliseconds: 200), () {
      onAfterDelay!();
      _timer!.cancel();
    });
  }

  static void delay300msFunction(BuildContext context,
      {@required VoidCallback? onAfterDelay, VoidCallback? onBeforeDelay}) {
    if (onBeforeDelay != null) onBeforeDelay();
    Timer? _timer;
    _timer = Timer(const Duration(milliseconds: 300), () {
      onAfterDelay!();
      _timer!.cancel();
    });
  }

  static void delay500msFunction(BuildContext context,
      {@required VoidCallback? onAfterDelay, VoidCallback? onBeforeDelay}) {
    if (onBeforeDelay != null) onBeforeDelay();
    Timer? _timer;
    _timer = Timer(const Duration(milliseconds: 500), () {
      onAfterDelay!();
      _timer!.cancel();
    });
  }
}
