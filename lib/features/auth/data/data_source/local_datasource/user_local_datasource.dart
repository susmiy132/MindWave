import 'dart:io';

import 'package:mindwave/core/network/hive_service.dart';
import 'package:mindwave/features/auth/data/data_source/user_data_source.dart';
import 'package:mindwave/features/auth/data/model/user_hive_model.dart';
import 'package:mindwave/features/auth/domain/entity/user_entity.dart';

class UserLocalDatasource implements IUserDataSource{

  final HiveService _hiveService;

  UserLocalDatasource({required HiveService HiveService})
    : _hiveService =HiveService;


  @override
  Future<UserEntity> getCurrentUser() {

   
    throw UnimplementedError();
  }

  @override
  Future<String> loginUser(String email, String password) async {
    try{
      final user = await _hiveService.loginUser(email, password);
      if(user == null) {
        throw Exception('Invalid email or password');
      }
      return user.userId ?? '';
    }catch(e){
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<void> registerUser(UserEntity user) async {
    try{
      //  To model
      final userModel = UserHiveModel.fromEntity(user);
      await _hiveService.registerUser(userModel);
    }catch(e) {
      throw Exception('Registraton failed: $e');
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) {
    throw UnimplementedError();
  }

}