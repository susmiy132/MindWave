// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:mindwave/features/auth/domain/entity/user_entity.dart';

// part 'user_api_model.g.dart';

// @JsonSerializable()
// class UserApiModel extends Equatable{
//   @JsonKey(name: '_id')
//   final String? userId;
//   final String fullName;
//   final String email;
//   final String phone;
//   final String? profileImage;
//   final String password;

//   const UserApiModel({
//     this.userId,
//     required this.fullName,
//     required this.email,
//     required this.phone,
//     required this.profileImage,
//     required this.password
//   });
  
//   factory UserApiModel.fromJson(Map<String, dynamic> json) => 
//       _$UserApiModelFromJson(json);

  
//   Map<String, dynamic> toJson() => _$UserApiModelToJson(this);

//   // To Entity
//   UserEntity toEntity() {
//     return UserEntity(
//       userId: userId,
//       fullName: fullName, 
//       email: email, 
//       phone: phone, 
//       profileImage: profileImage, 
//       password: password ?? '',
//     );
//   }

//   // From Entity
//   factory UserApiModel.fromEntity(UserEntity entity) {
//     final user = UserApiModel(
//       fullName: entity.fullName, 
//       email: entity.email, 
//       phone: entity.phone, 
//       profileImage: entity.profileImage, 
//       password: entity.password
//     );
//     return user;
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


import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mindwave/features/auth/domain/entity/user_entity.dart';

part 'user_api_model.g.dart';

@JsonSerializable()
class UserApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? userId;
  final String fullName;
  final String email;
  final String phone;
  final String? profileImage;
  final String password;

  const UserApiModel({
    this.userId,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.profileImage,
    required this.password,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);

  // Convert API model to domain entity
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      fullName: fullName,
      email: email,
      phone: phone,
      profileImage: profileImage,
      password: password,
    );
  }

  // Convert domain entity to API model
  factory UserApiModel.fromEntity(UserEntity entity) {
    return UserApiModel(
      userId: entity.userId,
      fullName: entity.fullName,
      email: entity.email,
      phone: entity.phone,
      profileImage: entity.profileImage,
      password: entity.password,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        fullName,
        email,
        phone,
        profileImage,
        password,
      ];
}

