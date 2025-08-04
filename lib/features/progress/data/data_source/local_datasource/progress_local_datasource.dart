import 'package:hive/hive.dart';
import 'package:mindwave/features/progress/data/model/progress_hive_model.dart';

class ProgressLocalDataSource {
  final Box<ProgressHiveModel> box;

  ProgressLocalDataSource(this.box);

  Future<void> addProgress(ProgressHiveModel progress) async {
    await box.put(progress.progressId, progress);
  }

  Future<List<ProgressHiveModel>> getAllProgress() async {
    return box.values.toList();
  }

  Future<void> updateProgress(ProgressHiveModel progress) async {
    await progress.save();
  }

  Future<void> deleteProgress(String progressId) async {
    await box.delete(progressId);
  }
}
