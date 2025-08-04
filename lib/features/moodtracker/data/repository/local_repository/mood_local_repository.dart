// import 'package:mindwave/features/moodtracker/data/data_source/mood_data_source.dart';
// import 'package:mindwave/features/moodtracker/domain/entity/mood_entity.dart';
// import 'package:mindwave/features/moodtracker/domain/repository/mood_repository.dart';
// import 'package:mindwave/features/moodtracker/data/model/mood_hive_model.dart';

// class LocalMoodRepositoryImpl implements MoodRepository {
//   final MoodDataSource localDataSource;

//   LocalMoodRepositoryImpl(this.localDataSource);

//   @override
//   Future<void> addMood(MoodEntity mood) async {
//     final model = MoodHiveModel.fromEntity(mood);
//     await localDataSource.addMood(model);
//   }

//   @override
//   Future<List<MoodEntity>> getAllMoods() async {
//     final models = await localDataSource.getAllMoods();
//     return models.map((model) => model.toEntity()).toList();
//   }

//   @override
//   Future<MoodEntity?> getMoodById(String moodId) async {
//     final model = await localDataSource.getMoodById(moodId);
//     return model?.toEntity();
//   }

//   @override
//   Future<void> updateMood(MoodEntity mood) async {
//     final model = MoodHiveModel.fromEntity(mood);
//     await localDataSource.updateMood(model);
//   }

//   @override
//   Future<void> deleteMood(String moodId) async {
//     await localDataSource.deleteMood(moodId);
//   }
// }
