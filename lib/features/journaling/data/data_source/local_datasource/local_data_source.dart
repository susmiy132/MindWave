import 'package:hive/hive.dart';
import 'package:mindwave/features/journaling/data/model/journal_hive_model.dart';
import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';

abstract class JournalLocalDataSource {
  Future<void> saveJournal(JournalHiveModel journal);

  Future<void> addJournal(JournalEntity journal) async {}

  Future<void> deleteJournal(String journalId) async {}

  Future<void> updateJournal(JournalEntity journal) async {}

  Future getAllJournals() async {}
}

class JournalLocalDataSourceImpl implements JournalLocalDataSource {
  final Box<JournalHiveModel> journalBox;

  JournalLocalDataSourceImpl(this.journalBox);

  @override
  Future<void> saveJournal(JournalHiveModel journal) async {
    await journalBox.add(journal);
  }
  
  @override
  Future<void> addJournal(JournalEntity journal) {
    // TODO: implement addJournal
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteJournal(String journalId) {
    // TODO: implement deleteJournal
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateJournal(JournalEntity journal) {
    // TODO: implement updateJournal
    throw UnimplementedError();
  }
  
  @override
  Future getAllJournals() {
    // TODO: implement getAllJournals
    throw UnimplementedError();
  }
}
