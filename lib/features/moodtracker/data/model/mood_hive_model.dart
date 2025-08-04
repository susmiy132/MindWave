
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mindwave/app/constant/hive/hive_table_constraint.dart';
import 'package:mindwave/features/moodtracker/domain/entity/mood_entity.dart';

part 'mood_hive_model.g.dart';

// dart run build_runner build -d

@HiveType(typeId: 0)
class MoodHiveModel extends Equatable {
  @HiveField(0)
  final String? moodId;
  @HiveField(1)
  final String moodLabel;
  @HiveField(2)
  final String moodEmoji;
  @HiveField(3)
  final DateTime moodDateTime;

  const MoodHiveModel({
    this.moodId,
    required this.moodLabel,
    required this.moodEmoji,
    required this.moodDateTime,
  });

  /// ✅ FIXED: Changed from const to factory
  factory MoodHiveModel.initial() {
    return MoodHiveModel(
      moodId: null,
      moodLabel: '',
      moodEmoji: '',
      moodDateTime: DateTime(2000, 1, 1),
    );
  }
  // Convert to domain entity
  MoodEntity toEntity() {
    return MoodEntity(
      moodId: moodId,
      moodLabel: moodLabel,
      moodEmoji: moodEmoji,
      moodDateTime: moodDateTime,
    );
  }

  // Convert from domain entity
  factory MoodHiveModel.fromEntity(MoodEntity entity) {
    return MoodHiveModel(
      moodId: entity.moodId,
      moodLabel: entity.moodLabel,
      moodEmoji: entity.moodEmoji,
      moodDateTime: entity.moodDateTime,
    );
  }

  @override
  List<Object?> get props => [
        moodId,
        moodLabel,
        moodEmoji,
        moodDateTime,
      ];
}
