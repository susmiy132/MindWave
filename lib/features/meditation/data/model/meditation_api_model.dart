// import 'package:json_annotation/json_annotation.dart';
// import 'package:mindwave/features/meditation/domain/entity/meditation_entity.dart';

// part 'meditation_api_model.g.dart';

// @JsonSerializable()
// class MeditationApiModel {
//   @JsonKey(name: '_id')
//   final String id;
//   final String title;
//   final String description;
//   final DateTime createdAt;

//   const MeditationApiModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.createdAt,
//   });

//   /// From JSON
//   factory MeditationApiModel.fromJson(Map<String, dynamic> json) =>
//       _$MeditationApiModelFromJson(json);

//   /// To JSON
//   Map<String, dynamic> toJson() => _$MeditationApiModelToJson(this);

//   /// Convert to Entity
//   MeditationEntity toEntity() => MeditationEntity(
//         id: id,
//         title: title,
//         description: description,
//         createdAt: createdAt,
//       );

//   /// Convert from Entity
//   factory MeditationApiModel.fromEntity(MeditationEntity entity) {
//     return MeditationApiModel(
//       id: entity.id,
//       title: entity.title,
//       description: entity.description,
//       createdAt: entity.createdAt,
//     );
//   }
// }
