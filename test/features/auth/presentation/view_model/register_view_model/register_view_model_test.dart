// // import 'package:bloc_test/bloc_test.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:mindwave/features/auth/presentation/view/login_view.dart';
// // import 'package:mindwave/features/auth/presentation/view/register_view.dart';
// // import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_event.dart';
// // import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_state.dart';
// // import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_view_model.dart';
// // import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_event.dart';
// // import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_state.dart';
// // import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_view_model.dart';
// // import 'package:mocktail/mocktail.dart';

// // class MockRegisterViewModel extends MockBloc<RegisterEvent, RegisterState> implements RegisterViewModel{}
// // void main() {
// //   late MockRegisterViewModel registerViewModel;

// //   setUp(() {
// //     registerViewModel = MockRegisterViewModel();
// //   });

// //   Widget loadRegisterViewModel() {
// //     return BlocProvider<RegisterViewModel>(
// //       create: (context) => registerViewModel,
// //       child: MaterialApp(home: RegisterView()),
// //     );
// //   }
// //   testWidgets('register view model ...', (tester) async {

// //     when(() => registerViewModel.state).thenReturn(RegisterState.initial());

// //     await tester.pumpWidget(loadRegisterViewModel());
// //     await tester.pumpAndSettle();

// //     // final button by text
// //     final result = find.widgetWithText(ElevatedButton, 'Register');
// //     expect(result, findsOneWidget);
// //   });
// // }


// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:dartz/dartz.dart';

// import 'package:mindwave/features/auth/domain/use_case/register_usecase.dart';
// import 'package:mindwave/features/auth/domain/use_case/upload_profile_image_usecase.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_event.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_state.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_view_model.dart';
// import 'package:mindwave/core/error/failure.dart';

// // --- Fake classes for fallback values ---
// class FakeRegisterUsecaseParams extends Fake implements RegisterUsecaseParams {}
// class FakeUploadImageParams extends Fake implements UploadImageParams {}
// class FakeBuildContext extends Fake implements BuildContext {}

// // --- Mocks ---
// class MockRegisterUsecase extends Mock implements UserRegisterUsecase {}
// class MockUploadImageUsecase extends Mock implements UploadImageUsecase {}

// void main() {
//   late MockRegisterUsecase mockRegisterUsecase;
//   late MockUploadImageUsecase mockUploadImageUsecase;
//   late FakeBuildContext fakeContext;

//   // Register fallback values for mocktail
//   setUpAll(() {
//     registerFallbackValue(FakeRegisterUsecaseParams());
//     registerFallbackValue(FakeUploadImageParams());
//     registerFallbackValue(FakeBuildContext());
//   });

//   setUp(() {
//     mockRegisterUsecase = MockRegisterUsecase();
//     mockUploadImageUsecase = MockUploadImageUsecase();
//     fakeContext = FakeBuildContext();
//   });

//   group('RegisterViewModel - RegisterUserEvent', () {
//     blocTest<RegisterViewModel, RegisterState>(
//       'emits [loading, success] on successful registration',
//       build: () {
//         when(() => mockRegisterUsecase.call(any()))
//             .thenAnswer((_) async => const Right(null));
//         return RegisterViewModel(mockRegisterUsecase, mockUploadImageUsecase);
//       },
//       act: (bloc) {
//         bloc.add(RegisterUserEvent(
//           fullName: 'Test',
//           email: 'test@example.com',
//           phone: '1234567890',
//           password: 'password123',
//           context: fakeContext,
//         ));
//       },
//       expect: () => [
//         RegisterState.initial().copyWith(isLoading: true),
//         RegisterState.initial().copyWith(isLoading: false, isSuccess: true),
//       ],
//       verify: (bloc) {
//         verify(() => mockRegisterUsecase.call(any())).called(1);
//       },
//     );

//     blocTest<RegisterViewModel, RegisterState>(
//       'emits [loading, failure] on registration error',
//       build: () {
//         when(() => mockRegisterUsecase.call(any())).thenAnswer(
//           (_) async => Left(LocalDatabaseFailure(message: 'Failed')),
//         );
//         return RegisterViewModel(mockRegisterUsecase, mockUploadImageUsecase);
//       },
//       act: (bloc) {
//         bloc.add(RegisterUserEvent(
//           fullName: 'Test',
//           email: 'test@example.com',
//           phone: '1234567890',
//           password: 'password123',
//           context: fakeContext,
//         ));
//       },
//       expect: () => [
//         RegisterState.initial().copyWith(isLoading: true),
//         RegisterState.initial().copyWith(isLoading: false, isSuccess: false),
//       ],
//       verify: (bloc) {
//         verify(() => mockRegisterUsecase.call(any())).called(1);
//       },
//     );
//   });

//   group('RegisterViewModel - UploadImageEvent', () {
//     blocTest<RegisterViewModel, RegisterState>(
//       'emits [loading, success] on successful image upload',
//       build: () {
//         when(() => mockUploadImageUsecase.call(any()))
//             .thenAnswer((_) async => Right('uploaded_image.png'));
//         return RegisterViewModel(mockRegisterUsecase, mockUploadImageUsecase);
//       },
//       act: (bloc) => bloc.add(UploadImageEvent(imagePath: 'dummy_path.png')),
//       expect: () => [
//         RegisterState.initial().copyWith(isLoading: true),
//         RegisterState.initial().copyWith(
//           isLoading: false,
//           isSuccess: true,
//           imageName: 'uploaded_image.png',
//         ),
//       ],
//       verify: (bloc) {
//         verify(() => mockUploadImageUsecase.call(any())).called(1);
//       },
//     );

//     blocTest<RegisterViewModel, RegisterState>(
//       'emits [loading, failure] on image upload failure',
//       build: () {
//         when(() => mockUploadImageUsecase.call(any())).thenAnswer(
//           (_) async => Left(LocalDatabaseFailure(message: 'Upload failed')),
//         );
//         return RegisterViewModel(mockRegisterUsecase, mockUploadImageUsecase);
//       },
//       act: (bloc) => bloc.add(UploadImageEvent(imagePath: 'dummy_path.png')),
//       expect: () => [
//         RegisterState.initial().copyWith(isLoading: true),
//         RegisterState.initial().copyWith(isLoading: false, isSuccess: false),
//       ],
//       verify: (bloc) {
//         verify(() => mockUploadImageUsecase.call(any())).called(1);
//       },
//     );
//   });
// }


// import 'dart:io';

// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:mindwave/core/error/failure.dart';
// import 'package:mindwave/features/auth/domain/use_case/register_usecase.dart';
// import 'package:mindwave/features/auth/domain/use_case/upload_profile_image_usecase.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_event.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_state.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_view_model.dart';

// class MockRegisterUsecase extends Mock implements UserRegisterUsecase {}

// class MockUploadImageUsecase extends Mock implements UploadImageUsecase {}

// class MockBuildContext extends Mock implements BuildContext {}

// class MockFile extends Mock implements File {}

// void main() {
//   late RegisterViewModel registerViewModel;
//   late MockRegisterUsecase mockRegisterUsecase;
//   late MockUploadImageUsecase mockUploadImageUsecase;
//   late BuildContext context;

//   setUpAll(() {
//     registerFallbackValue(RegisterUsecaseParams.initial());
//     registerFallbackValue(UploadImageParams(file: MockFile()));
//   });

//   setUp(() {
//     mockRegisterUsecase = MockRegisterUsecase();
//     mockUploadImageUsecase = MockUploadImageUsecase();
//     context = MockBuildContext();
//     registerViewModel = RegisterViewModel(
//       mockRegisterUsecase,
//       mockUploadImageUsecase,
//     );
//   });

//   tearDown(() {
//     registerViewModel.close();
//   });

//   const fullName = "Susmi Thakur";
//   const email = "susmi@example.com";
//   const phone = "9876543210";
//   const password = "securePassword123";

//   blocTest<RegisterViewModel, RegisterState>(
//     'emits [loading, success] when registration succeeds',
//     build: () {
//       when(() => mockRegisterUsecase(any()))
//           .thenAnswer((_) async => const Right(null));
//       return registerViewModel;
//     },
//     act: (bloc) {
//       bloc.emit(bloc.state.copyWith(imageName: "uploaded_image.png")); // simulate uploaded image
//       bloc.add(RegisterUserEvent(
//         fullName: fullName,
//         email: email,
//         phone: phone,
//         password: password,
//         context: context,
//       ));
//     },
//     expect: () => [
//       registerViewModel.state.copyWith(isLoading: true),
//       registerViewModel.state.copyWith(
//         isLoading: false,
//         isSuccess: true,
//         imageName: "uploaded_image.png",
//       ),
//     ],
//     verify: (_) {
//       verify(() => mockRegisterUsecase(any())).called(1);
//     },
//   );

//   blocTest<RegisterViewModel, RegisterState>(
//     'emits [loading, failure] when registration fails',
//     build: () {
//       when(() => mockRegisterUsecase(any())).thenAnswer(
//         (_) async => Left(LocalDatabaseFailure(message: "Registration failed")),
//       );
//       return registerViewModel;
//     },
//     act: (bloc) => bloc.add(RegisterUserEvent(
//       fullName: fullName,
//       email: email,
//       phone: phone,
//       password: password,
//       context: context,
//     )),
//     expect: () => [
//       registerViewModel.state.copyWith(isLoading: true),
//       registerViewModel.state.copyWith(isLoading: false, isSuccess: false),
//     ],
//     verify: (_) {
//       verify(() => mockRegisterUsecase(any())).called(1);
//     },
//   );

//   blocTest<RegisterViewModel, RegisterState>(
//     'emits [loading, success with imageName] when image upload succeeds',
//     build: () {
//       when(() => mockUploadImageUsecase(any()))
//           .thenAnswer((_) async => const Right("uploaded.png"));
//       return registerViewModel;
//     },
//     act: (bloc) => bloc.add(UploadImageEvent(file: MockFile())),
//     expect: () => [
//       registerViewModel.state.copyWith(isLoading: true),
//       registerViewModel.state.copyWith(
//         isLoading: false,
//         isSuccess: true,
//         imageName: "uploaded.png",
//       ),
//     ],
//     verify: (_) {
//       verify(() => mockUploadImageUsecase(any())).called(1);
//     },
//   );

//   blocTest<RegisterViewModel, RegisterState>(
//     'emits [loading, failure] when image upload fails',
//     build: () {
//       when(() => mockUploadImageUsecase(any()))
//           .thenAnswer((_) async => Left(LocalDatabaseFailure(message: "Upload failed")));
//       return registerViewModel;
//     },
//     act: (bloc) => bloc.add(UploadImageEvent(file: MockFile())),
//     expect: () => [
//       registerViewModel.state.copyWith(isLoading: true),
//       registerViewModel.state.copyWith(isLoading: false, isSuccess: false),
//     ],
//     verify: (_) {
//       verify(() => mockUploadImageUsecase(any())).called(1);
//     },
//   );
// }

import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:mindwave/core/error/failure.dart';
import 'package:mindwave/features/auth/domain/use_case/register_usecase.dart';
import 'package:mindwave/features/auth/domain/use_case/upload_profile_image_usecase.dart';
import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_event.dart';
import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_state.dart';
import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_view_model.dart';

class MockRegisterUsecase extends Mock implements UserRegisterUsecase {}
class MockUploadImageUsecase extends Mock implements UploadImageUsecase {}
class MockBuildContext extends Mock implements BuildContext {}
class MockFile extends Mock implements File {}

// 🧪 Updated mock snackbar
void mockSnackBar({
  required BuildContext context,
  required String message,
  Color? color,
}) {
  // no-op for testing
}

void main() {
  late RegisterViewModel registerViewModel;
  late MockRegisterUsecase mockRegisterUsecase;
  late MockUploadImageUsecase mockUploadImageUsecase;
  late BuildContext context;

  setUpAll(() {
    registerFallbackValue(RegisterUsecaseParams.initial());
    registerFallbackValue(UploadImageParams(file: MockFile()));
  });

  setUp(() {
    mockRegisterUsecase = MockRegisterUsecase();
    mockUploadImageUsecase = MockUploadImageUsecase();
    context = MockBuildContext();
    registerViewModel = RegisterViewModel(
      mockRegisterUsecase,
      mockUploadImageUsecase,
    );
  });

  tearDown(() {
    registerViewModel.close();
  });

  const fullName = "Susmi Thakur";
  const email = "susmi@example.com";
  const phone = "9876543210";
  const password = "securePassword123";

  // blocTest<RegisterViewModel, RegisterState>(
  //   'emits [loading, success] when registration succeeds',
  //   build: () {
  //     when(() => mockRegisterUsecase(any()))
  //         .thenAnswer((_) async => const Right(null));
  //     return registerViewModel;
  //   },
  //   act: (bloc) {
  //     bloc.emit(bloc.state.copyWith(imageName: "uploaded_image.png"));
  //     bloc.add(RegisterUserEvent(
  //       fullName: fullName,
  //       email: email,
  //       phone: phone,
  //       password: password,
  //       context: context,
  //     ));
  //   },
  //   expect: () => [
  //     registerViewModel.state.copyWith(isLoading: true),
  //     registerViewModel.state.copyWith(
  //       isLoading: false,
  //       isSuccess: true,
  //       imageName: "uploaded_image.png",
  //     ),
  //   ],
  //   verify: (_) {
  //     verify(() => mockRegisterUsecase(any())).called(1);
  //   },
  // );

  // blocTest<RegisterViewModel, RegisterState>(
  //   'emits [loading, failure] when registration fails',
  //   build: () {
  //     when(() => mockRegisterUsecase(any())).thenAnswer(
  //       (_) async => Left(LocalDatabaseFailure(message: "Registration failed")),
  //     );
  //     return registerViewModel;
  //   },
  //   act: (bloc) => bloc.add(RegisterUserEvent(
  //     fullName: fullName,
  //     email: email,
  //     phone: phone,
  //     password: password,
  //     context: context,
  //   )),
  //   expect: () => [
  //     registerViewModel.state.copyWith(isLoading: true),
  //     registerViewModel.state.copyWith(isLoading: false, isSuccess: false),
  //   ],
  //   verify: (_) {
  //     verify(() => mockRegisterUsecase(any())).called(1);
  //   },
  // );

  blocTest<RegisterViewModel, RegisterState>(
    'emits [loading, success with imageName] when image upload succeeds',
    build: () {
      when(() => mockUploadImageUsecase(any()))
          .thenAnswer((_) async => const Right("uploaded.png"));
      return registerViewModel;
    },
    act: (bloc) => bloc.add(UploadImageEvent(file: MockFile())),
    expect: () => [
      RegisterState.initial().copyWith(isLoading: true),
      RegisterState.initial().copyWith(
        isLoading: false,
        isSuccess: true,
        imageName: "uploaded.png",
      ),
    ],
    verify: (_) {
      verify(() => mockUploadImageUsecase(any())).called(1);
    },
  );

  blocTest<RegisterViewModel, RegisterState>(
    'emits [loading, failure] when image upload fails',
    build: () {
      when(() => mockUploadImageUsecase(any())).thenAnswer(
        (_) async => Left(LocalDatabaseFailure(message: "Upload failed")),
      );
      return registerViewModel;
    },
    act: (bloc) => bloc.add(UploadImageEvent(file: MockFile())),
    expect: () => [
      RegisterState.initial().copyWith(isLoading: true),
      RegisterState.initial().copyWith(isLoading: false, isSuccess: false),
    ],
    verify: (_) {
      verify(() => mockUploadImageUsecase(any())).called(1);
    },
  );
}
