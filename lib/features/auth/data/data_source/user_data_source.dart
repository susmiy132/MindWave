import 'dart:io';

import 'package:mindwave/features/auth/domain/entity/user_entity.dart';

abstract interface class IUserDataSource{
  Future<void> registerUser(UserEntity user);

  Future<String> loginUser(
    String email,
    String password,
  );

  Future<String> uploadProfilePicture(File file);

  Future<UserEntity> getCurrentUser();

}