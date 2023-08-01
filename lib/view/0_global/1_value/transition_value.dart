import 'package:sport/controller/d_delay_function.dart';
import 'package:flutter/material.dart';

goToPage(BuildContext context,
    {@required Widget? page, int? animationRouteID, bool? pushReplace}) {
  bool pushReplaceInit = pushReplace ?? false;
  int routeID = animationRouteID != null
      ? (animationRouteID > 3 ? 3 : animationRouteID)
      : 1;
  return pushReplaceInit
      ? Navigator.pushReplacement(
          context,
          routeID == 1
              ? FadeRoute(page: page!)
              : routeID == 2
                  ? SlideRightRoute(page: page!)
                  : SlideLeftRoute(page: page!))
      : Navigator.push(
          context,
          routeID == 1
              ? FadeRoute(page: page!)
              : routeID == 2
                  ? SlideRightRoute(page: page!)
                  : SlideLeftRoute(page: page!));
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class SlideLeftRoute extends PageRouteBuilder {
  final Widget page;
  SlideLeftRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

goToPageClearOtherStack(BuildContext context,
    {@required Widget? page,
    int? animationRouteID,
    AnimationController? anim}) {
  int routeID = animationRouteID != null
      ? (animationRouteID > 3 ? 3 : animationRouteID)
      : 1;
  switchPage() {
    Navigator.pushAndRemoveUntil(
        context,
        routeID == 1
            ? FadeRoute(page: page!)
            : routeID == 2
                ? SlideLeftRoute(page: page!)
                : SlideRightRoute(page: page!),
        (Route<dynamic> route) => false);
  }

  if (anim != null) {
    DelayFunction.delay200msFunction(context,
        onBeforeDelay: () {
          anim.reverse();
        },
        onAfterDelay: () => switchPage());
  } else {
    switchPage();
  }
}
