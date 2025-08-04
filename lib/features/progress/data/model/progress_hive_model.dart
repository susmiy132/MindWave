// // lib/features/progress/data/model/progress_hive_model.dart

// import 'package:hive/hive.dart';
// import 'package:mindwave/features/progress/domain/entity/progress_entity.dart';

// part 'progress_hive_model.g.dart';

// @HiveType(typeId: 2) // Choose a unique typeId per model
// class ProgressHiveModel extends HiveObject {
//   @HiveField(0)
//   String? progressId;

//   @HiveField(1)
//   DateTime date;

//   @HiveField(2)
//   int meditationMinutes;

//   @HiveField(3)
//   String moodLabel;

//   @HiveField(4)
//   String moodIconName;

//   @HiveField(5)
//   bool journaled;

//   ProgressHiveModel({
//     this.progressId,
//     required this.date,
//     required this.meditationMinutes,
//     required this.moodLabel,
//     required this.moodIconName,
//     required this.journaled,
//   });

//   // Convert Entity -> HiveModel
//   factory ProgressHiveModel.fromEntity(ProgressEntity entity) {
//     return ProgressHiveModel(
//       progressId: entity.progressId,
//       date: entity.date,
//       meditationMinutes: entity.meditationMinutes,
//       moodLabel: entity.moodLabel,
//       moodIconName: entity.moodIconName,
//       journaled: entity.journaled,
//     );
//   }

//   // Convert HiveModel -> Entity
//   ProgressEntity toEntity() {
//     return ProgressEntity(
//       progressId: progressId,
//       date: date,
//       meditationMinutes: meditationMinutes,
//       moodLabel: moodLabel,
//       moodIconName: moodIconName,
//       journaled: journaled,
//     );
//   }
// }
