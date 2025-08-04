// lib/features/progress/domain/entity/progress_entity.dart

import 'package:equatable/equatable.dart';

class ProgressEntity extends Equatable {
  final String? progressId; // optional id for DB
  final DateTime date;
  final int meditationMinutes;
  final String moodLabel;
  final String moodIconName; // store icon as String name or code point
  final bool journaled;

  const ProgressEntity({
    this.progressId,
    required this.date,
    required this.meditationMinutes,
    required this.moodLabel,
    required this.moodIconName,
    required this.journaled,
  });

  @override
  List<Object?> get props => [
        progressId,
        date,
        meditationMinutes,
        moodLabel,
        moodIconName,
        journaled,
      ];
}
