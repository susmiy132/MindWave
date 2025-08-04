import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';


abstract class JournalRepository {
  Future<void> addJournal(JournalEntity journal);
  Future<List<JournalEntity>> getJournals();
  Future<void> deleteJournal(String journalId);
  Future<void> updateJournal(JournalEntity journal);

  Future<void> saveJournal(JournalEntity journal) async {}
}

