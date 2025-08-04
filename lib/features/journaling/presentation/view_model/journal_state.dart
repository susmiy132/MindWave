// import 'package:equatable/equatable.dart';

// abstract class JournalState extends Equatable {
//   const JournalState();

//   @override
//   List<Object?> get props => [];
// }

// class JournalInitial extends JournalState {}

// class JournalSaving extends JournalState {}

// class JournalSaved extends JournalState {}

// class JournalError extends JournalState {
//   final String message;

//   const JournalError(this.message);

//   @override
//   List<Object?> get props => [message];
// }


import 'package:equatable/equatable.dart';
import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';

abstract class JournalState extends Equatable {
  const JournalState();
  @override
  List<Object?> get props => [];
}

class JournalInitial extends JournalState {}

class JournalLoading extends JournalState {}

class JournalLoaded extends JournalState {
  final List<JournalEntity> journals;
  const JournalLoaded(this.journals, {required void journal});
  @override
  List<Object?> get props => [journals];
}

class JournalError extends JournalState {
  final String message;
  const JournalError(this.message);
  @override
  List<Object?> get props => [message];
}
