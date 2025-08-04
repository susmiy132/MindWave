import 'package:mindwave/features/moodtracker/data/model/mood_hive_model.dart';

abstract class MoodDataSource {
  Future<void> addMood(MoodHiveModel mood);
  Future<List<MoodHiveModel>> getAllMoods();
  Future<MoodHiveModel?> getMoodById(String moodId);
  Future<void> updateMood(MoodHiveModel mood);
  Future<void> deleteMood(String moodId);
}
