import 'package:mindwave/features/progress/domain/entity/progress_entity.dart';
import 'package:mindwave/features/progress/domain/repository/progress_repository.dart';

class UpdateProgressUseCase {
  final ProgressRepository repository;
  UpdateProgressUseCase(this.repository);

  Future<void> call(ProgressEntity progress) => repository.updateProgress(progress);
}
