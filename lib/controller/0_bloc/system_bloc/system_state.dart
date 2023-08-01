part of 'system_bloc.dart';

@immutable
abstract class SystemState {}

class SystemInitial extends SystemState {}

class Result extends SystemState {
  Result() : super();
}
