// // import 'package:hive/hive.dart';
// // import 'package:mindwave/app/constant/hive/hive_table_constraint.dart';
// // import 'package:mindwave/features/moodtracker/data/data_source/mood_data_source.dart';
// // import 'package:mindwave/features/moodtracker/data/model/mood_hive_model.dart';

// // class MoodLocalDataSource implements MoodDataSource {
// //   final Box<MoodHiveModel> _moodBox;

// //   MoodLocalDataSource()
// //       : _moodBox = Hive.box<MoodHiveModel>(HiveTableConstant.moodBox);

// //   @override
// //   Future<void> addMood(MoodHiveModel mood) async {
// //     await _moodBox.put(mood.moodId, mood);
// //   }

// //   @override
// //   Future<List<MoodHiveModel>> getAllMoods() async {
// //     return _moodBox.values.toList();
// //   }

// //   @override
// //   Future<MoodHiveModel?> getMoodById(String moodId) async {
// //     return _moodBox.get(moodId);
// //   }

// //   @override
// //   Future<void> updateMood(MoodHiveModel mood) async {
// //     await _moodBox.put(mood.moodId, mood);
// //   }

// //   @override
// //   Future<void> deleteMood(String moodId) async {
// //     await _moodBox.delete(moodId);
// //   }
// // }


// import 'package:hive/hive.dart';
// import 'package:mindwave/features/progress/data/data_source/progress_data_source.dart';
// import 'package:mindwave/features/progress/data/model/progress_hive_model.dart';

// class LocalProgressDataSource implements ProgressDataSource {
//   static const String _boxName = 'progressBox';

//   @override
//   Future<void> addProgress(ProgressHiveModel progress) async {
//     final box = await Hive.openBox<ProgressHiveModel>(_boxName);
//     await box.put(progress.progressId, progress);
//   }

//   @override
//   Future<List<ProgressHiveModel>> getAllProgress() async {
//     final box = await Hive.openBox<ProgressHiveModel>(_boxName);
//     return box.values.toList();
//   }

//   @override
//   Future<void> updateProgress(ProgressHiveModel progress) async {
//     final box = await Hive.openBox<ProgressHiveModel>(_boxName);
//     await box.put(progress.progressId, progress);
//   }

//   @override
//   Future<void> deleteProgress(String id) async {
//     final box = await Hive.openBox<ProgressHiveModel>(_boxName);
//     await box.delete(id);
//   }
// }
