import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:mindwave/app/shared_pref/token_shared_prefs.dart';
=======
>>>>>>> sprint3
import 'package:mindwave/app/use_case/use_case.dart';
import 'package:mindwave/core/error/failure.dart';
import 'package:mindwave/features/auth/domain/repository/user_repository.dart';

class LoginParams extends Equatable{
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  // Initial Constructor
  const LoginParams.initial() : email = '', password ='';
  
  @override
  List<Object?> get props => [email, password];
}

class UserLoginUsecase implements UseCaseWithParams<String, LoginParams>{
  final IUserRepository _userRepository;
<<<<<<< HEAD
  final TokenSharedPrefs _tokenSharedPrefs;


  UserLoginUsecase({
    required IUserRepository userRepository,
    required TokenSharedPrefs tokenSharedPrefs,
    })
    : _tokenSharedPrefs = tokenSharedPrefs,
     _userRepository = userRepository;
=======

  UserLoginUsecase({required IUserRepository userrepository})
    : _userRepository = userrepository;
>>>>>>> sprint3


  @override
  Future<Either<Failure, String>> call(LoginParams params) async {
<<<<<<< HEAD
    // return await _userRepository.loginUser(
    //   params.email, 
    //   params.password);
    final token = await _userRepository.loginUser(
      params.email, 
      params.password,
    );
    return token.fold((failure) => Left(failure), (token) {
      _tokenSharedPrefs.saveToken(token).then((result) {
        result.fold(
          (failure) => debugPrint('Failed to save token: ${failure.message}'), 
          (_) => debugPrint('Tokn save successfully'),
          );
      });
      return Right(token);
    });
  }
}
=======
    return await _userRepository.loginUser(
      params.email, 
      params.password);
  }}
>>>>>>> sprint3
