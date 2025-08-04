import 'package:mindwave/features/progress/domain/repository/progress_repository.dart';

class DeleteProgressUseCase {
  final ProgressRepository repository;
  DeleteProgressUseCase(this.repository);

  Future<void> call(String id) => repository.deleteProgress(id);
}
