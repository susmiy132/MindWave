import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mindwave/app/constant/api_endpoints.dart';
import 'package:mindwave/core/network/api_service.dart';
import 'package:mindwave/features/auth/data/data_source/user_data_source.dart';
import 'package:mindwave/features/auth/data/model/user_api_model.dart';
import 'package:mindwave/features/auth/domain/entity/user_entity.dart';

class UserRemoteDatasource implements IUserDataSource{
  final ApiService _apiService;
  UserRemoteDatasource({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<UserEntity> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<String> loginUser(String email, String password) async {
    try{
      final response = await _apiService.dio.post(
        ApiEndpoints.login,
        data: {
          'email':email, 
          'password': password
        },
      );
      if(response.statusCode == 200) {
        print(response.data);
        return response.data['token'];
        // final str = response.data['token'];
        // return str;
      } else {
        throw Exception('Failed to login: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Error : ${e.message}');
    }catch(e) {
      throw Exception('An unexpected error occured: $e');
    }
  }

  @override
  Future<void> registerUser(UserEntity user) async {
    try {
      // convert to API model
      final userApiModel = UserApiModel.fromEntity(user);
      final response = await _apiService.dio.post(
        ApiEndpoints.register,
        data: userApiModel.toJson(),
      );
      if (response.statusCode == 200) {
        // Assuming the API returns a success message of the created
        return;

      } else {
        throw Exception(
          "Failed to register user: ${response.statusMessage}",
        );
      }

    } on DioException catch(e){
      // Handle DioException
      throw Exception("Error: ${e.message}");
    } catch (e) {
      //  Handle other exceptions
      throw Exception("An unexpected error occured: $e");
    }
  }


  @override
  Future<String> uploadProfilePicture(File file) async {
    try{
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        'profilePicture': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      Response response = await _apiService.dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      if(response.statusCode == 200){
        // Extract the image name form the response
        final str = response.data['data'];
        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(
        'Failed to upload profile picture: ${e.message}'
      );
    } catch (e) {
      throw Exception('Failed to upload profile picture: $e');
    }
  }

}