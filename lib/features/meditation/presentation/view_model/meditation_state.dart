// lib/features/meditation/presentation/view_model/meditation_state.dart

import 'package:equatable/equatable.dart';
import '../../domain/entity/meditation_entity.dart';

abstract class MeditationState extends Equatable {
  const MeditationState();

  @override
  List<Object?> get props => [];
}

class MeditationInitial extends MeditationState {}

class MeditationLoading extends MeditationState {}

class MeditationLoaded extends MeditationState {
  final List<MeditationEntity> meditations;

  const MeditationLoaded(this.meditations);

  @override
  List<Object?> get props => [meditations];
}

class MeditationError extends MeditationState {
  final String message;

  const MeditationError(this.message);

  @override
  List<Object?> get props => [message];
}
