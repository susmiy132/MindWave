import 'package:equatable/equatable.dart';

abstract class MeditationRecordEvent extends Equatable {
  const MeditationRecordEvent();

  @override
  List<Object?> get props => [];
}

class StartMeditation extends MeditationRecordEvent {}

class Tick extends MeditationRecordEvent {}

class StopMeditation extends MeditationRecordEvent {}
