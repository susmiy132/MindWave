// import 'package:equatable/equatable.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:mindwave/app/constant/hive/hive_table_constraint.dart';
// import 'package:mindwave/features/auth/domain/entity/user_entity.dart';

// part 'user_hive_model.g.dart';
// // dart run build_runner build -d

// @HiveType(typeId: HiveTableConstant.userTableId )
// class UserHiveModel extends Equatable{
  
//   @HiveField(0)
//   final String? userId;
//   @HiveField(1)
//   final String fullName;
//   @HiveField(2)
//   final String email;
//   @HiveField(3)
//   final String phone;
//   @HiveField(4)
//   final String? profileImage;
//   @HiveField(5)
//   final String password;

//   const UserHiveModel({
//     this.userId,
//     required this.fullName,
//     required this.email,
//     required this.phone,
//     required this.profileImage,
//     required this.password
//   });

//   // Initial constructor for creating a new user
//   const UserHiveModel.initial() 
//     : userId = null,
//     fullName = '',
//     email = '',
//     phone = '',
//     profileImage = null,
//     password = '';

//   //  To Entity
//   UserEntity toEntity() {
//     return UserEntity(
//       userId: userId, 
//       fullName: fullName, 
//       email: email, 
//       phone: phone, 
//       profileImage: profileImage, 
//       password: password
//     );
//   }


//   // From entity
//   factory UserHiveModel.fromEntity(UserEntity user) {
//     return UserHiveModel(
//       userId: user.userId, 
//       fullName: user.fullName,
//       email: user.email, 
//       phone: user.phone, 
//       profileImage: user.profileImage, 
//       password: user.password,
//     );
//   }
  
//   @override
//   List<Object?> get props => [
//     userId,
//     fullName,
//     email,
//     phone,
//     profileImage,
//     password
//   ];

// }