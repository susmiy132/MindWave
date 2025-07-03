import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mindwave/core/error/failure.dart';
import 'package:mindwave/features/auth/data/data_source/remote_datasource/user_remote_datasource.dart';
import 'package:mindwave/features/auth/domain/entity/user_entity.dart';
import 'package:mindwave/features/auth/domain/repository/user_repository.dart';

class UserRemoteRepository implements IUserRepository{
  final UserRemoteDatasource _userRemoteDatasource;

  UserRemoteRepository({
    required UserRemoteDatasource userRemoteDatasource,
  }) : _userRemoteDatasource = userRemoteDatasource;


  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try{
      final user = await _userRemoteDatasource.getCurrentUser();
      return Right(user);
    } catch (e) {
      return Left(RemoteDabaseFailue(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> loginUser(String email, String password) async {
    try{
      
      final token = await _userRemoteDatasource.loginUser(email, password);
      return Right(token);
    }catch (e) {
      return Left(RemoteDabaseFailue(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> registerUser(UserEntity user) async {
    try{
      await _userRemoteDatasource.registerUser(user);
      return const Right(null);
    } catch (e) {
      return Left(RemoteDabaseFailue(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    try{
      final imageUrl = await _userRemoteDatasource.uploadProfilePicture(
        file,
      );
      return Right(imageUrl);
    }catch(e){
      return Left(RemoteDabaseFailue(message: e.toString()));
    }
  }

}