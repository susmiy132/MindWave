import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';
import 'package:mindwave/features/journaling/domain/repository/journal_repository.dart';


class UpdateJournalUseCase {
  final JournalRepository repository;

  UpdateJournalUseCase(this.repository);

  Future<void> call(JournalEntity journal) async {
    await repository.updateJournal(journal);
  }
}
