// import 'package:equatable/equatable.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import 'package:mindwave/app/constant/hive/hive_table_constraint.dart';
// import 'package:mindwave/features/profile/domain/entity/profile_entity.dart';

// part 'profile_hive_model.g.dart';
// // flutter packages pub run build_runner build --delete-conflicting-outputs


// @HiveType(typeId: 0)
// class ProfileHiveModel extends Equatable {
//   @HiveField(0)
//   final String userId;

//   @HiveField(1)
//   final String name;

//   @HiveField(2)
//   final String email;

//   @HiveField(3)
//   final String phone;

//   @HiveField(4)
//   final String? avatarUrl;

//   @HiveField(5)
//   final String? bio;

//   const ProfileHiveModel({
//     required this.userId,
//     required this.name,
//     required this.email,
//     required this.phone,
//     this.avatarUrl,
//     this.bio,
//   });

//   // Initial empty constructor if needed
//   const ProfileHiveModel.initial()
//       : userId = '',
//         name = '',
//         email = '',
//         phone = '',
//         avatarUrl = null,
//         bio = null;

//   // Convert to domain entity
//   ProfileEntity toEntity() {
//     return ProfileEntity(
//       userId: userId,
//       name: name,
//       email: email,
//       phone: phone,
//       avatarUrl: avatarUrl,
//       bio: bio, id: '',
//     );
//   }

//   // Create from domain entity
//   factory ProfileHiveModel.fromEntity(ProfileEntity entity) {
//     return ProfileHiveModel(
//       userId: entity.userId,
//       name: entity.name,
//       email: entity.email,
//       phone: entity.phone,
//       avatarUrl: entity.avatarUrl,
//       bio: entity.bio,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         userId,
//         name,
//         email,
//         phone,
//         avatarUrl,
//         bio,
//       ];
// }
