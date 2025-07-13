// // test/unit/user_register_usecase_test.dart
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mindwave/features/auth/domain/use_case/register_usecase.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mindwave/features/auth/domain/entity/user_entity.dart';
// import 'package:mindwave/features/auth/domain/repository/user_repository.dart';
// import 'package:mindwave/core/error/failure.dart';

// class MockUserRepository extends Mock implements IUserRepository {}

// void main() {
//   late MockUserRepository repository;
//   late UserRegisterUsecase useCase;

//   setUp(() {
//     repository = MockUserRepository();
//     useCase = UserRegisterUsecase(userrepository: repository);
//   });

//   test('should register and return UserEntity', () async {
    
//     when(() => repository.registerUser(any(), any())).thenAnswer((invocation,
//     )async{
//       final fullName = invocation.positionalArguments[0] as String;
//       final password = invocation.positionalArguments[1] as String;

//       expect(result, Right('fullname'));
//     })
//     // final user = UserEntity(fullName: 'Test', email: 'test@test.com', password: '123456');
//     // when(() => repository.register(user)).thenAnswer((_) async => Right(user));

//     // final result = await useCase.call(user);

//     // expect(result, Right(user));
//     // verify(() => repository.register(user)).called(1);
//   });
// }


import 'package:flutter_test/flutter_test.dart';
import 'package:mindwave/features/auth/domain/use_case/register_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:mindwave/features/auth/domain/repository/user_repository.dart';
import 'package:mindwave/core/error/failure.dart';
import 'package:mindwave/features/auth/domain/entity/user_entity.dart';

// Mock class
class MockUserRepository extends Mock implements IUserRepository {}

void main() {
  late UserRegisterUsecase usecase;
  late MockUserRepository mockUserRepository;

  const params = RegisterUsecaseParams(
    fullName: 'Susmi Thakur',
    email: 'susmi@example.com',
    phone: '9876543210',
    profileImage: 'https://example.com/susmi.png',
    password: 'securePassword123',
  );

  setUpAll(() {
    registerFallbackValue(params);
    registerFallbackValue(
      UserEntity(
        fullName: params.fullName,
        email: params.email,
        phone: params.phone,
        profileImage: params.profileImage,
        password: params.password,
      ),
    );
  });

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = UserRegisterUsecase(userrepository: mockUserRepository);
  });

  test('should register user successfully', () async {
    // Arrange
    when(() => mockUserRepository.registerUser(any()))
        .thenAnswer((_) async => const Right(null));

    // Act
    final result = await usecase.call(params);

    // Assert
    expect(result, const Right(null));
    verify(() => mockUserRepository.registerUser(any())).called(1);
  });

  // test('should return failure when registration fails', () async {
  //   // Arrange
  //   final failure = LocalDatabaseFailure(message: 'Registration failed');
  //   when(() => mockUserRepository.registerUser(any()))
  //       .thenAnswer((_) async => Left(failure));

  //   // Act
  //   final result = await usecase.call(params);

  //   // Assert
  //   expect(result, Left(failure));
  //   verify(() => mockUserRepository.registerUser(any())).called(1);
  // });
}
