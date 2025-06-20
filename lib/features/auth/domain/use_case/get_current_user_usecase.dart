// import 'package:dartz/dartz.dart';
// import 'package:mindwave/app/use_case/use_case.dart';
// import 'package:mindwave/core/error/failure.dart';
// import 'package:mindwave/features/auth/domain/entity/user_entity.dart';
// import 'package:mindwave/features/auth/domain/repository/user_repository.dart';

// class GetCurrentUserUsecase implements UseCaseWithoutParams<UserEntity>{
//   final IUserRepository _userRepository;

//   GetCurrentUserUsecase({required IUserRepository userRepository})
//     : _userRepository = userRepository;


//   @override
//   Future<Either<Failure, UserEntity>> call() {
//     return _userRepository.getCurrentUser();
//   }}