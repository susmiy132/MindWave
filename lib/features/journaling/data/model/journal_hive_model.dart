import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mindwave/app/constant/hive/hive_table_constraint.dart';
import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';

part 'journal_hive_model.g.dart'; // ✅ Fix: Added missing semicolon

@HiveType(typeId: 0)
class JournalHiveModel extends Equatable {

  @HiveField(0)
  final String? journalId;
  @HiveField(1)
  final DateTime? dateTime;
  @HiveField(2)
  final String? journalTitle;
  @HiveField(3)
  final String? journalmood;
  @HiveField(4)
  final String? place;
  @HiveField(5)
  final String? weather;
  @HiveField(6)
  final String? journalImage;
  @HiveField(7)
  final String? journalContent;

  const JournalHiveModel({
    this.journalId,
    required this.dateTime,
    required this.journalTitle,
    required this.journalmood,
    required this.place,
    required this.weather,
    required this.journalImage,
    required this.journalContent,
  });

  const JournalHiveModel.Initial()
      : journalId = null,
        dateTime = null,
        journalTitle = " ",
        journalmood = " ",
        place = " ",
        weather = " ",
        journalImage = " ",
        journalContent = " ";

  JournalEntity toEntity() {
    return JournalEntity(
      journalId: journalId,
      dateTime: dateTime,
      journalTitle: journalTitle,
      journalmood: journalmood,
      place: place,
      weather: weather,
      journalImage: journalImage,
      journalContent: journalContent,
    );
  }

  factory JournalHiveModel.fromEntity(JournalEntity journals) {
    return JournalHiveModel(
      journalId: journals.journalId,
      dateTime: journals.dateTime,
      journalTitle: journals.journalTitle,
      journalmood: journals.journalmood,
      place: journals.place,
      weather: journals.weather,
      journalImage: journals.journalImage,
      journalContent: journals.journalContent,
    );
  }

  @override
  List<Object?> get props => [
        journalId,
        dateTime,
        journalTitle,
        journalmood,
        place,
        weather,
        journalImage,
        journalContent,
      ];
}
