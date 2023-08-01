// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:sport/controller/0_bloc/system_bloc/system_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocLoader extends StatelessWidget {
  final MaterialApp? child;
  BlocLoader({@required this.child});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => SystemBloc(),
      ),
    ], child: child!);
  }
}
