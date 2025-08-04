// lib/features/meditation/presentation/view_model/meditation_event.dart

import 'package:equatable/equatable.dart';
import '../../domain/entity/meditation_entity.dart';

abstract class MeditationEvent extends Equatable {
  const MeditationEvent();

  @override
  List<Object?> get props => [];
}

class LoadMeditationsEvent extends MeditationEvent {}

class AddMeditationEvent extends MeditationEvent {
  final MeditationEntity meditation;

  const AddMeditationEvent(this.meditation);

  @override
  List<Object?> get props => [meditation];
}

class DeleteMeditationEvent extends MeditationEvent {
  final String id;

  const DeleteMeditationEvent(this.id);

  @override
  List<Object?> get props => [id];
}
