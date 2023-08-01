import 'package:sport/bloc_loader.dart';
import 'package:sport/controller/0_bloc/system_bloc/system_bloc.dart';
import 'package:sport/view/0_global/1_value/variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport/view/1_splash_view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  VisibilityDetectorController.instance.updateInterval = Duration.zero;
  runApp(const UpSport());
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class UpSport extends StatelessWidget {
  const UpSport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocLoader(
      child: MaterialApp(
          builder: (context, child) {
            return ScrollConfiguration(
                behavior: MyBehavior(),
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: 1.0,
                  ), //set desired text scale factor here0
                  child: child!,
                ));
          },
          navigatorKey: navKey,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<SystemBloc, SystemState>(builder: (context, state) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
                value: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent),
                child: SplashView());
          })),
    );
  }
}
