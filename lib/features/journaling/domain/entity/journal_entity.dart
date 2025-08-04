import 'package:equatable/equatable.dart';
import 'package:mindwave/features/auth/domain/entity/user_entity.dart';

class JournalEntity extends Equatable{
  final String? journalId;
  final DateTime? dateTime;
  final String? journalTitle;
  final String? journalmood;
  final String? place;
  final String? weather;
  final String? journalImage;
  final String? journalContent;

  const JournalEntity({
    this.journalId,
    required this.dateTime,
    required this.journalTitle,
    required this.journalmood,
    required this.place,
    required this.weather,
    required this.journalImage,
    required this.journalContent
  });

  @override
  // TODO: implement props
  List<Object?> get props => [journalId, dateTime, journalTitle, journalmood, place, weather, journalImage, journalContent];

  toEntity() {}
}