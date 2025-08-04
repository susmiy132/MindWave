


// import 'package:flutter_test/flutter_test.dart';
// import 'package:mindwave/features/auth/domain/use_case/login_usecase.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mindwave/features/auth/domain/repository/user_repository.dart';
// import 'package:mindwave/app/shared_pref/token_shared_prefs.dart';
// import 'package:mindwave/core/error/failure.dart';

// class MockUserRepository extends Mock implements IUserRepository {}
// class MockTokenSharedPrefs extends Mock implements TokenSharedPrefs {}

// void main() {
//   late UserLoginUsecase usecase;
//   late MockUserRepository mockUserRepository;
//   late MockTokenSharedPrefs mockTokenSharedPrefs;

//   const loginParams = LoginParams(email: 'test@example.com', password: 'password123');
//   const token = 'mock_token';

//   setUpAll(() {
//     registerFallbackValue(loginParams); // required for mocktail
//   });

//   setUp(() {
//     mockUserRepository = MockUserRepository();
//     mockTokenSharedPrefs = MockTokenSharedPrefs();
//     usecase = UserLoginUsecase(
//       userRepository: mockUserRepository,
//       tokenSharedPrefs: mockTokenSharedPrefs,
//     );
//   });

//   test('should return token and save it when login is successful', () async {
//     // Arrange
//     when(() => mockUserRepository.loginUser(any(), any()))
//         .thenAnswer((_) async => const Right(token));
//     when(() => mockTokenSharedPrefs.saveToken(any()))
//         .thenAnswer((_) async => const Right(null));

//     // Act
//     final result = await usecase.call(loginParams);

//     // Assert
//     expect(result, const Right(token));
//     verify(() => mockUserRepository.loginUser(loginParams.email, loginParams.password)).called(1);
//     verify(() => mockTokenSharedPrefs.saveToken(token)).called(1);
//   });

//   test('should return failure when login fails', () async {
//     // Arrange
//     final failure = LocalDatabaseFailure(message: 'Login failed');
//     when(() => mockUserRepository.loginUser(any(), any()))
//         .thenAnswer((_) async => Left(failure));

//     // Act
//     final result = await usecase.call(loginParams);

//     // Assert
//     expect(result, Left(failure));
//     verify(() => mockUserRepository.loginUser(loginParams.email, loginParams.password)).called(1);
//     verifyNever(() => mockTokenSharedPrefs.saveToken(any()));
//   });

//   test('should return token but print failure when saving token fails', () async {
//     // Arrange
//     when(() => mockUserRepository.loginUser(any(), any()))
//         .thenAnswer((_) async => const Right(token));
//     when(() => mockTokenSharedPrefs.saveToken(any()))
//         .thenAnswer((_) async => Left(LocalDatabaseFailure(message: 'Save failed')));

//     // Act
//     final result = await usecase.call(loginParams);

//     // Assert
//     expect(result, const Right(token));
//     verify(() => mockUserRepository.loginUser(loginParams.email, loginParams.password)).called(1);
//     verify(() => mockTokenSharedPrefs.saveToken(token)).called(1);
//   });
// }
