// // lib/features/profile/data/datasource/profile_local_data_source.dart

// import 'package:hive/hive.dart';
// import 'package:mindwave/features/profile/data/model/profile_hive_model.dart';
// import 'package:mindwave/features/profile/data/data_source/profile_data_source.dart';
// import 'package:mindwave/features/profile/domain/entity/profile_entity.dart';

// class ProfileLocalDataSource implements ProfileDataSource {
//   final Box<ProfileHiveModel> _profileBox;

//   ProfileLocalDataSource(this._profileBox);

//   @override
//   Future<ProfileEntity?> getProfile(String userId) async {
//     final profileHive = _profileBox.get(userId);
//     if (profileHive != null) {
//       return profileHive.toEntity();
//     }
//     return null;
//   }

//   @override
//   Future<void> saveProfile(ProfileEntity profile) async {
//     final profileHive = ProfileHiveModel.fromEntity(profile);
//     await _profileBox.put(profile.userId, profileHive);
//   }

//   @override
//   Future<void> deleteProfile(String userId) async {
//     await _profileBox.delete(userId);
//   }
// }
