import 'package:mindwave/features/progress/data/data_source/local_datasource/progress_local_datasource.dart';
import 'package:mindwave/features/progress/data/model/progress_hive_model.dart';
import 'package:mindwave/features/progress/domain/entity/progress_entity.dart';
import 'package:mindwave/features/progress/domain/repository/progress_repository.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  final ProgressLocalDataSource localDataSource;

  ProgressRepositoryImpl(this.localDataSource);

  @override
  Future<void> addProgress(ProgressEntity progress) {
    final model = ProgressHiveModel.fromEntity(progress);
    return localDataSource.addProgress(model);
  }

  @override
  Future<void> deleteProgress(String progressId) {
    return localDataSource.deleteProgress(progressId);
  }

  @override
  Future<List<ProgressEntity>> getAllProgress() async {
    final models = await localDataSource.getAllProgress();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> updateProgress(ProgressEntity progress) {
    final model = ProgressHiveModel.fromEntity(progress);
    return localDataSource.updateProgress(model);
  }
}
