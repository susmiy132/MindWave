// // lib/features/meditation/data/model/meditation_hive_model.dart

// import 'package:hive/hive.dart';
// import 'package:mindwave/features/meditation/domain/entity/meditation_entity.dart';

// part 'meditation_hive_model.g.dart';

// @HiveType(typeId: 0)
// class MeditationHiveModel extends HiveObject {
//   @HiveField(0)
//   String id;

//   @HiveField(1)
//   String title;

//   @HiveField(2)
//   String description;

//   @HiveField(3)
//   DateTime createdAt;

//   MeditationHiveModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.createdAt,
//   });

//   // Convert HiveModel to Entity
//   MeditationEntity toEntity() {
//     return MeditationEntity(
//       id: id,
//       title: title,
//       description: description,
//       createdAt: createdAt,
//     );
//   }

//   // Convert Entity to HiveModel
//   static MeditationHiveModel fromEntity(MeditationEntity entity) {
//     return MeditationHiveModel(
//       id: entity.id,
//       title: entity.title,
//       description: entity.description,
//       createdAt: entity.createdAt,
//     );
//   }
// }
