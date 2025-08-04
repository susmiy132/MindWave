import 'package:mindwave/features/progress/domain/entity/progress_entity.dart';

abstract class ProgressRepository {
  Future<void> addProgress(ProgressEntity progress);
  Future<List<ProgressEntity>> getAllProgress();
  Future<void> updateProgress(ProgressEntity progress);
  Future<void> deleteProgress(String progressId);
}
