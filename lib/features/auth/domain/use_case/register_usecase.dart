// // Params
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:mindwave/app/use_case/use_case.dart';
// import 'package:mindwave/core/error/failure.dart';
// import 'package:mindwave/features/auth/domain/entity/user_entity.dart';
// import 'package:mindwave/features/auth/domain/repository/user_repository.dart';

// class RegisterUsecaseParams extends Equatable{

//   final String fullName;
//   final String email;
//   final String phone;
//   final String? profileImage;
//   final String password;

//   const RegisterUsecaseParams({
//     required this.fullName,
//     required this.email,
//     required this.phone,
//     this.profileImage,
//     required this.password
//   });

//   const RegisterUsecaseParams.initial()
//     : fullName = '',
//       email = '',
//       phone = '',
//       profileImage = null,
//       password = '';

//   @override
//   List<Object?> get props => [
//     fullName,
//     email,
//     phone,
//     profileImage,
//     password
//   ];
// }

// //  UseCasewithParams 
// class UserRegisterUsecase 
//     implements UseCaseWithParams<void, RegisterUsecaseParams> {
//   final IUserRepository _userRepository;

//   UserRegisterUsecase({required IUserRepository userrepository})
//       : _userRepository = userrepository;
      
//         @override
//         Future<Either<Failure, void>> call(RegisterUsecaseParams params) {
//           final userEntity = UserEntity(
//             fullName: params.fullName, 
//             email: params.email, 
//             phone: params.phone, 
//             profileImage: params.profileImage, 
//             password: params.password);

//             return _userRepository.registerUser(userEntity);
//         }
  

// }