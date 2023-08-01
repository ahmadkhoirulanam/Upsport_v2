import 'package:sport/controller/b_shared_prefs.dart';
import 'package:sport/view/0_global/1_value/variable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'system_event.dart';
part 'system_state.dart';

class SystemBloc extends Bloc<SystemEvent, SystemState> {
  SystemBloc() : super(SystemInitial()) {
    on<ModeTema>(onModeTema);
    on<Bahasa>(onBahasa);
    on<AppLifeCycleResumedFunc>(onAppLifeCycleResumedFunc);
  }
  Future<void> onModeTema(ModeTema event, Emitter<SystemState> emit) async {
    themeModeId = event.idTema ??
        (themeModeId == 0
            ? 1
            : themeModeId == 1
                ? 2
                : 0);

    SharedPrefs.switchModeTema(navKey.currentContext!,
        fungsi: "save", modeTemaId: themeModeId);
    emit(Result());
  }

  Future<void> onBahasa(Bahasa event, Emitter<SystemState> emit) async {
    bahasaId = bahasaId == 0 ? 1 : 0;
    print("Bahasa ID :  $bahasaId");
    emit(Result());
  }

  Future<void> onAppLifeCycleResumedFunc(
      AppLifeCycleResumedFunc event, Emitter<SystemState> emit) async {}
}
