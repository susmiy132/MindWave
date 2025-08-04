// import 'package:equatable/equatable.dart';
// import '../../domain/entity/journal_entity.dart';

// abstract class JournalEvent extends Equatable {
//   const JournalEvent();

//   @override
//   List<Object?> get props => [];
// }

// class SaveJournalEvent extends JournalEvent {
//   final JournalEntity journal;

//   const SaveJournalEvent(this.journal);

//   @override
//   List<Object?> get props => [journal];
// }


import 'package:equatable/equatable.dart';
import '../../domain/entity/journal_entity.dart';

/// Base class for all journal events
abstract class JournalEvent extends Equatable {
  const JournalEvent();

  @override
  List<Object?> get props => [];
}

/// Event to save a new journal entry
class SaveJournalEvent extends JournalEvent {
  final JournalEntity journal;

  const SaveJournalEvent(this.journal);

  @override
  List<Object?> get props => [journal];
}

/// Event to load all journals (optional but recommended)
class LoadJournalsEvent extends JournalEvent {
  const LoadJournalsEvent();
}

/// Event to delete a journal by ID
class DeleteJournalEvent extends JournalEvent {
  final String journalId;

  const DeleteJournalEvent(this.journalId);

  @override
  List<Object?> get props => [journalId];
}

/// Event to update an existing journal entry
class UpdateJournalEvent extends JournalEvent {
  final JournalEntity updatedJournal;

  const UpdateJournalEvent(this.updatedJournal);

  @override
  List<Object?> get props => [updatedJournal];
}
