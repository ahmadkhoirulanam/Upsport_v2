part of 'system_bloc.dart';

@immutable
abstract class SystemEvent {}

class ModeTema extends SystemEvent {
  final int? idTema;
  ModeTema({this.idTema});
}

class Bahasa extends SystemEvent {}

class AppLifeCycleResumedFunc extends SystemEvent {}
