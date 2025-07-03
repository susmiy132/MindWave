
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mindwave/core/error/failure.dart';
import 'package:mindwave/features/auth/domain/entity/user_entity.dart';
// import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_event.dart';

abstract interface class IUserRepository {
  Future<Either<Failure, void>> registerUser(UserEntity user);

  Future<Either<Failure, String>> loginUser(
    // LoginEvent params
    String email,
    String password,
  );

  Future<Either<Failure, String>> uploadProfilePicture(File file);

  Future<Either<Failure, UserEntity>> getCurrentUser();
}
