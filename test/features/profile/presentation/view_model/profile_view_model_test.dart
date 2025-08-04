// import 'package:flutter_test/flutter_test.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:mindwave/features/profile/domain/entity/profile_entity.dart';
// import 'package:mindwave/features/profile/domain/use_case/delete_profile_usecase.dart';
// import 'package:mindwave/features/profile/domain/use_case/get_profile_usecase.dart';
// import 'package:mindwave/features/profile/domain/use_case/save_profile_usecase.dart';
// import 'package:mindwave/features/profile/presentation/view_model/profile_view_model.dart';

// class MockGetProfileUseCase extends Mock implements GetProfileUseCase {}

// class MockSaveProfileUseCase extends Mock implements SaveProfileUseCase {}

// class MockDeleteProfileUseCase extends Mock implements DeleteProfileUseCase {}

// void main() {
//   late ProfileViewModel viewModel;
//   late MockGetProfileUseCase mockGetProfileUseCase;
//   late MockSaveProfileUseCase mockSaveProfileUseCase;
//   late MockDeleteProfileUseCase mockDeleteProfileUseCase;

//   setUpAll(() async {
//     // Initialize Hive and open box
//     await Hive.initFlutter();
//     await Hive.openBox('authBox');

//     final box = Hive.box('authBox');
//     await box.put('userId', 'user123'); // Put dummy userId for tests
//   });

//   setUp(() {
//     mockGetProfileUseCase = MockGetProfileUseCase();
//     mockSaveProfileUseCase = MockSaveProfileUseCase();
//     mockDeleteProfileUseCase = MockDeleteProfileUseCase();

//     viewModel = ProfileViewModel(
//       getProfileUseCase: mockGetProfileUseCase,
//       saveProfileUseCase: mockSaveProfileUseCase,
//       deleteProfileUseCase: mockDeleteProfileUseCase,
//     );
//   });

//   final testProfile = ProfileEntity(
//     id: 'user123',
//     name: 'Test User',
//     email: 'test@example.com', userId: '', phone: '',
//   );

//   test('initial state is correct', () {
//     expect(viewModel.profile, null);
//     expect(viewModel.isLoading, false);
//   });

//   test('loadProfile updates profile and loading state', () async {
//     when(() => mockGetProfileUseCase('user123'))
//         .thenAnswer((_) async => testProfile);

//     final states = <bool>[];
//     viewModel.addListener(() {
//       states.add(viewModel.isLoading);
//     });

//     await viewModel.loadProfile();

//     expect(viewModel.profile, testProfile);
//     expect(states, [true, false]);
//   });

//   test('saveProfile saves and updates profile and loading state', () async {
//     when(() => mockSaveProfileUseCase(testProfile)).thenAnswer((_) async {});

//     final states = <bool>[];
//     viewModel.addListener(() {
//       states.add(viewModel.isLoading);
//     });

//     await viewModel.saveProfile(testProfile);

//     expect(viewModel.profile, testProfile);
//     expect(states, [true, false]);
//   });

//   test('deleteProfile deletes profile and updates loading state', () async {
//     when(() => mockDeleteProfileUseCase('user123')).thenAnswer((_) async {});

//     final states = <bool>[];
//     viewModel.addListener(() {
//       states.add(viewModel.isLoading);
//     });

//     await viewModel.deleteProfile();

//     expect(viewModel.profile, null);
//     expect(states, [true, false]);
//   });
// }
