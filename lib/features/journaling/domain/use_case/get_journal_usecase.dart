import '../entity/journal_entity.dart';
import '../repository/journal_repository.dart';

class GetJournalUseCase {
  final JournalRepository repository;

  GetJournalUseCase(this.repository);

  Future<void> call(JournalEntity journal) async {
    await repository.saveJournal(journal);
  }
}
