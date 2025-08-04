import 'package:mindwave/features/moodtracker/domain/entity/mood_entity.dart';

abstract class MoodRepository {
  /// Save a mood
  Future<void> addMood(MoodEntity mood);

  /// Get all saved moods
  Future<List<MoodEntity>> getAllMoods();

  /// Delete a mood by its ID
  Future<void> deleteMood(String moodId);

  /// Update an existing mood
  Future<void> updateMood(MoodEntity mood);

  /// Get a single mood by its ID (optional)
  Future<MoodEntity?> getMoodById(String moodId);
}
