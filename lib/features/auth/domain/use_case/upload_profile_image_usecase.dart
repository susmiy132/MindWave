import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mindwave/app/use_case/use_case.dart';
import 'package:mindwave/core/error/failure.dart';
import 'package:mindwave/features/auth/domain/repository/user_repository.dart';

class UploadImageParams {
  final File file;

  const UploadImageParams({required this.file});
}

class UploadImageUsecase 
    implements UseCaseWithParams<String, UploadImageParams>{
  final IUserRepository _userRepository;

  UploadImageUsecase({required IUserRepository userRepository})
    : _userRepository = userRepository;

  @override
  Future<Either<Failure, String>> call(UploadImageParams params) {
    return _userRepository.uploadProfilePicture(params.file);
  }
    } 