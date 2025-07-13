// // test/unit/user_login_usecase_test.dart
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mindwave/app/shared_pref/token_shared_prefs.dart';
// import 'package:mindwave/features/auth/domain/use_case/login_usecase.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mindwave/features/auth/domain/entity/user_entity.dart';
// import 'package:mindwave/features/auth/domain/repository/user_repository.dart';
// import 'package:mindwave/core/error/failure.dart';

// class MockUserRepository extends Mock implements IUserRepository {
//   login(UserEntity user) {}
// }
// class MockTokenSharedPrefs extends Mock implements TokenSharedPrefs {}

// void main() {
//   late MockUserRepository repository;
//   late TokenSharedPrefs token;
//   late UserLoginUsecase useCase;

//   setUp(() {
//     repository = MockUserRepository();
//     token = MockTokenSharedPrefs();
//     useCase = UserLoginUsecase(userRepository: repository, tokenSharedPrefs: token);
//   });

//   test('should login and return UserEntity', () async {
//     final user = UserEntity(email: 'test@test.com', password: '123456', fullName: '', phone: '', profileImage: '');
//     when(() => repository.login(user)).thenAnswer((_) async => Right(user));

//     final result = await useCase.call(user as LoginParams);

//     expect(result, Right(user));
//     verify(() => repository.login(user)).called(1);
//   });
// }

// // test/unit/user_login_usecase_test.dart
// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:mindwave/app/shared_pref/token_shared_prefs.dart';
// import 'package:mindwave/features/auth/domain/use_case/login_usecase.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mindwave/features/auth/domain/entity/user_entity.dart';
// import 'package:mindwave/features/auth/domain/repository/user_repository.dart';
// import 'package:mindwave/core/error/failure.dart';

// // ✅ Only implement the interface — don’t override the method
// class MockUserRepository extends Mock implements IUserRepository {}

// class MockTokenSharedPrefs extends Mock implements TokenSharedPrefs {}

// void main() {
//   late MockUserRepository repository;
//   late MockTokenSharedPrefs token;
//   late UserLoginUsecase useCase;

//   setUp(() {
//     repository = MockUserRepository();
//     token = MockTokenSharedPrefs();
//     useCase = UserLoginUsecase(userRepository: repository, tokenSharedPrefs: token);
//   });

//   test('should login and return UserEntity', 
//   () async {
//     when(() => repository.loginUser(any(), any())).thenAnswer((invocation,)async{
//       final email = invocation.positionalArguments[0] as String;
//       final password = invocation.positionalArguments[1] as  String;
//       if(email == 'susmita' && password == 'susmita12') {
//         return Future.value(const Right('token'));
//       } else{
//         return Future.value(
//           const Left(RemoteDabaseFailue(message: 'Invalid email and password')
//           ),
//         );
//       }
//     });

//     when(
//       () => token.saveToken(any()),
//     ).thenAnswer((_)async => Right(null));

//     final result = await useCase(
//       LoginParams(email: 'susmita', password: 'susmita12'),
//     );

//     expect(result, Right(token));

//     verify(() => repository.loginUser(any(), any())).called(1);
//     verify(() => token.saveToken(any())).called(1);

//     verifyNoMoreInteractions(repository);
//     verifyNoMoreInteractions(token);
//     // Arrange
//     // final user = UserEntity(
//     //   email: 'test@test.com',
//     //   password: '123456',
//     //   fullName: '',
//     //   phone: '',
//     //   profileImage: '',
//     // );

//     // ✅ Fix: Use `any()` matcher to avoid object identity issues
//   //   when(() => repository.loginUser(any(), any())).thenAnswer((_) async => Right('mock_token'));
//   //   when(() => token.saveToken(any())).thenAnswer((_) async => Future.value());

//   //   // Act
//   //   final result = await useCase.call(user);

//   //   // Assert
//   //   expect(result, Right(user));
//   //   verify(() => repository.loginUser(user)).called(1);
//   //   verifyNever(() => token.saveToken(any())); // Or verify it if applicable
//   });

//   tearDown(() {
//     reset(repository);
//     reset(token);
//   });
// }



import 'package:flutter_test/flutter_test.dart';
import 'package:mindwave/features/auth/domain/use_case/login_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:mindwave/features/auth/domain/repository/user_repository.dart';
import 'package:mindwave/app/shared_pref/token_shared_prefs.dart';
import 'package:mindwave/core/error/failure.dart';

class MockUserRepository extends Mock implements IUserRepository {}
class MockTokenSharedPrefs extends Mock implements TokenSharedPrefs {}

void main() {
  late UserLoginUsecase usecase;
  late MockUserRepository mockUserRepository;
  late MockTokenSharedPrefs mockTokenSharedPrefs;

  const loginParams = LoginParams(email: 'test@example.com', password: 'password123');
  const token = 'mock_token';

  setUpAll(() {
    registerFallbackValue(loginParams); // required for mocktail
  });

  setUp(() {
    mockUserRepository = MockUserRepository();
    mockTokenSharedPrefs = MockTokenSharedPrefs();
    usecase = UserLoginUsecase(
      userRepository: mockUserRepository,
      tokenSharedPrefs: mockTokenSharedPrefs,
    );
  });

  test('should return token and save it when login is successful', () async {
    // Arrange
    when(() => mockUserRepository.loginUser(any(), any()))
        .thenAnswer((_) async => const Right(token));
    when(() => mockTokenSharedPrefs.saveToken(any()))
        .thenAnswer((_) async => const Right(null));

    // Act
    final result = await usecase.call(loginParams);

    // Assert
    expect(result, const Right(token));
    verify(() => mockUserRepository.loginUser(loginParams.email, loginParams.password)).called(1);
    verify(() => mockTokenSharedPrefs.saveToken(token)).called(1);
  });

  test('should return failure when login fails', () async {
    // Arrange
    final failure = LocalDatabaseFailure(message: 'Login failed');
    when(() => mockUserRepository.loginUser(any(), any()))
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await usecase.call(loginParams);

    // Assert
    expect(result, Left(failure));
    verify(() => mockUserRepository.loginUser(loginParams.email, loginParams.password)).called(1);
    verifyNever(() => mockTokenSharedPrefs.saveToken(any()));
  });

  test('should return token but print failure when saving token fails', () async {
    // Arrange
    when(() => mockUserRepository.loginUser(any(), any()))
        .thenAnswer((_) async => const Right(token));
    when(() => mockTokenSharedPrefs.saveToken(any()))
        .thenAnswer((_) async => Left(LocalDatabaseFailure(message: 'Save failed')));

    // Act
    final result = await usecase.call(loginParams);

    // Assert
    expect(result, const Right(token));
    verify(() => mockUserRepository.loginUser(loginParams.email, loginParams.password)).called(1);
    verify(() => mockTokenSharedPrefs.saveToken(token)).called(1);
  });
}
