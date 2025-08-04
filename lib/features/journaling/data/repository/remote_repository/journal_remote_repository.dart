import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';
import 'package:mindwave/features/journaling/domain/repository/journal_repository.dart';
import 'package:mindwave/features/journaling/data/data_source/journal_data_source.dart';

class JournalRepositoryImpl implements JournalRepository {
  final IJournalDataSource remoteDataSource;
  final String token; // Pass this in during construction or fetch via auth service

  JournalRepositoryImpl({
    required this.remoteDataSource,
    required this.token,
  });

  @override
  Future<void> addJournal(JournalEntity journal) async {
    await remoteDataSource.createJournal(journal, token);
  }

  @override
  Future<void> deleteJournal(String journalId) async {
    await remoteDataSource.deleteJournal(journalId, token);
  }

  @override
  Future<List<JournalEntity>> getJournals() async {
    return await remoteDataSource.getAllJournals(token);
  }

  @override
  Future<void> updateJournal(JournalEntity journal) async {
    await remoteDataSource.updateJournal(journal, token);
  }

  @override
  Future<void> saveJournal(JournalEntity journal) async {
    // You can reuse addJournal or implement conditional logic
    await addJournal(journal);
  }
}
