import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mindwave/core/error/failure.dart';
import 'package:mindwave/features/auth/data/data_source/local_datasource/user_local_datasource.dart';
import 'package:mindwave/features/auth/domain/entity/user_entity.dart';
import 'package:mindwave/features/auth/domain/repository/user_repository.dart';

class UserLocalRepository implements IUserRepository{

  final UserLocalDatasource _localDatasource;
  
  UserLocalRepository({required UserLocalDatasource localDatasource})
    : _localDatasource = localDatasource;


  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> loginUser(
    String email, String password
    ) async {
      try{
        final userId = await _localDatasource.loginUser(email, password);
        return Right(userId);
      }catch(e) {
        return Left(LocalDatabaseFailure(message: 'Login Failed: $e'));
      }
  }

  @override
  Future<Either<Failure, void>> registerUser(UserEntity user) async {
    try{
      await _localDatasource.registerUser(user);
      return Right(null);
    }catch(e){
      return Left(LocalDatabaseFailure(message: 'Registeration failed: $e'));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }

}