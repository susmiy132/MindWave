// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'journal_api_model.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// JournalApiModel _$JournalApiModelFromJson(Map<String, dynamic> json) =>
//     JournalApiModel(
//       journalId: json['_id'] as String?,
//       dateTime: json['dateTime'] == null
//           ? null
//           : DateTime.parse(json['dateTime'] as String),
//       journalTitle: json['journalTitle'] as String?,
//       journalmood: json['journalmood'] as String?,
//       place: json['place'] as String?,
//       weather: json['weather'] as String?,
//       journalImage: json['journalImage'] as String?,
//       journalContent: json['journalContent'] as String?,
//     );

// Map<String, dynamic> _$JournalApiModelToJson(JournalApiModel instance) =>
//     <String, dynamic>{
//       '_id': instance.journalId,
//       'dateTime': instance.dateTime?.toIso8601String(),
//       'journalTitle': instance.journalTitle,
//       'journalmood': instance.journalmood,
//       'place': instance.place,
//       'weather': instance.weather,
//       'journalImage': instance.journalImage,
//       'journalContent': instance.journalContent,
//     };
