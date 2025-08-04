// import 'package:mindwave/features/journaling/data/data_source/local_datasource/local_data_source.dart';
// import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';
// import 'package:mindwave/features/journaling/domain/repository/journal_repository.dart';

// class JournalRepositoryImpl implements JournalRepository {
//   final JournalLocalDataSource localDataSource;

//   JournalRepositoryImpl(this.localDataSource);

//   @override
//   Future<void> addJournal(JournalEntity journal) async {
//     await localDataSource.addJournal(journal);
//   }

//   @override
//   Future<void> deleteJournal(String journalId) async {
//     await localDataSource.deleteJournal(journalId);
//   }

//   @override
//   Future<void> updateJournal(JournalEntity journal) async {
//     await localDataSource.updateJournal(journal);
//   }
  
//   @override
//   Future<void> saveJournal(JournalEntity journal) {
//     throw UnimplementedError();
//   }
  
//   @override
//   Future<List<JournalEntity>> getJournals() {
//     // TODO: implement getJournals
//     throw UnimplementedError();
//   }
// }
