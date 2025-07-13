import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindwave/core/error/failure.dart';
import 'package:mindwave/features/auth/domain/use_case/login_usecase.dart';
import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_event.dart';
import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_state.dart';
import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_view_model.dart';
import 'package:mocktail/mocktail.dart';

// Mock class
class MockUserLoginUsecase extends Mock implements UserLoginUsecase {}

void main() {
  late MockUserLoginUsecase mockUserLoginUsecase;
  late LoginViewModel loginViewModel;

  const testEmail = 'test@example.com';
  const testPassword = 'password123';
  const testToken = 'mock_token';
  final testContext = MockBuildContext();

  setUpAll(() {
    registerFallbackValue(LoginParams(email: testEmail, password: testPassword));
  });

  setUp(() {
    mockUserLoginUsecase = MockUserLoginUsecase();
    loginViewModel = LoginViewModel(mockUserLoginUsecase);
  });

  tearDown(() {
    loginViewModel.close();
  });

  blocTest<LoginViewModel, LoginState>(
    'emits [loading, success] when login succeeds',
    build: () {
      when(() => mockUserLoginUsecase(any()))
          .thenAnswer((_) async => const Right(testToken));
      return loginViewModel;
    },
    act: (bloc) => bloc.add(LoginWithEmailAndPasswordEvent(
      email: testEmail,
      password: testPassword,
      context: testContext,
    )),
    expect: () => [
      LoginState.initial().copyWith(isLoading: true),
      LoginState.initial().copyWith(isLoading: false, isSuccess: true),
    ],
    verify: (_) {
      verify(() => mockUserLoginUsecase(any())).called(1);
    },
  );

  blocTest<LoginViewModel, LoginState>(
    'emits [loading, failure] when login fails',
    build: () {
      when(() => mockUserLoginUsecase(any()))
          .thenAnswer((_) async => Left(LocalDatabaseFailure(message: 'Login failed')));
      return loginViewModel;
    },
    act: (bloc) => bloc.add(LoginWithEmailAndPasswordEvent(
      email: testEmail,
      password: testPassword,
      context: testContext,
    )),
    expect: () => [
      LoginState.initial().copyWith(isLoading: true),
      LoginState.initial().copyWith(isLoading: false, isSuccess: false),
    ],
    verify: (_) {
      verify(() => mockUserLoginUsecase(any())).called(1);
    },
  );
}

/// Mock for BuildContext (if needed for snack bar)
class MockBuildContext extends Mock implements BuildContext {}
