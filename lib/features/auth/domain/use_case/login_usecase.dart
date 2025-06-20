// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:mindwave/app/use_case/use_case.dart';
// import 'package:mindwave/core/error/failure.dart';
// import 'package:mindwave/features/auth/domain/repository/user_repository.dart';

// class LoginParams extends Equatable{
//   final String email;
//   final String password;

//   const LoginParams({required this.email, required this.password});

//   // Initial Constructor
//   const LoginParams.initial() : email = '', password ='';
  
//   @override
//   List<Object?> get props => [email, password];
// }

// class UserLoginUsecase implements UseCaseWithParams<String, LoginParams>{
//   final IUserRepository _userRepository;

//   UserLoginUsecase({required IUserRepository userrepository})
//     : _userRepository = userrepository;


//   @override
//   Future<Either<Failure, String>> call(LoginParams params) async {
//     return await _userRepository.loginUser(
//       params.email, 
//       params.password);
//   }}