


import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';

part 'journal_api_model.g.dart'; // ← This semicolon was missing

@JsonSerializable()
class JournalApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? journalId;
  final DateTime? dateTime;
  final String? journalTitle;
  final String? journalmood;
  final String? place;
  final String? weather;
  final String? journalImage;
  final String? journalContent;

  const JournalApiModel({
    this.journalId,
    required this.dateTime,
    required this.journalTitle,
    required this.journalmood,
    required this.place,
    required this.weather,
    required this.journalImage,
    required this.journalContent,
  });

  factory JournalApiModel.fromJson(Map<String, dynamic> json) =>
      _$JournalApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$JournalApiModelToJson(this);

  // To Entity
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

  // From entity
  factory JournalApiModel.fromEntity(JournalEntity entity) {
    return JournalApiModel(
      journalId: entity.journalId,
      dateTime: entity.dateTime,
      journalTitle: entity.journalTitle,
      journalmood: entity.journalmood,
      place: entity.place,
      weather: entity.weather,
      journalImage: entity.journalImage,
      journalContent: entity.journalContent,
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
