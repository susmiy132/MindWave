import 'package:mindwave/features/progress/domain/entity/progress_entity.dart';
import 'package:mindwave/features/progress/domain/repository/progress_repository.dart';

class AddProgressUseCase {
  final ProgressRepository repository;
  AddProgressUseCase(this.repository);

  Future<void> call(ProgressEntity progress) => repository.addProgress(progress);
}
