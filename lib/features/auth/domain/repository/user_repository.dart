
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mindwave/core/error/failure.dart';
import 'package:mindwave/features/auth/domain/entity/user_entity.dart';
<<<<<<< HEAD
// import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_event.dart';
=======
>>>>>>> sprint3

abstract interface class IUserRepository {
  Future<Either<Failure, void>> registerUser(UserEntity userEntity);

  Future<Either<Failure, String>> loginUser(
<<<<<<< HEAD
    // LoginEvent params
=======
>>>>>>> sprint3
    String email,
    String password,
  );

  Future<Either<Failure, String>> uploadProfilePicture(File file);

  Future<Either<Failure, UserEntity>> getCurrentUser();
}
