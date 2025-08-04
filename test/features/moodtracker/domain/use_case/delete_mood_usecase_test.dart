// import 'package:flutter_test/flutter_test.dart';
// import 'package:mindwave/features/moodtracker/domain/use_case/delete_mood_usecase.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mindwave/features/moodtracker/domain/repository/mood_repository.dart';

// @GenerateMocks([MoodRepository])
// void main() {
//   late DeleteMoodUseCase useCase;
//   late MockMoodRepository mockRepository;

//   setUp(() {
//     mockRepository = MockMoodRepository();
//     useCase = DeleteMoodUseCase(mockRepository as MoodRepository);
//   });

//   test('should call deleteMood on repository with correct moodId', () async {
//     // arrange
//     const moodId = 'abc123';
//     when(mockRepository.deleteMood(moodId)).thenAnswer((_) async => Future.value());

//     // act
//     await useCase.call(moodId);

//     // assert
//     verify(mockRepository.deleteMood(moodId)).called(1);
//   });
// }

// class MockMoodRepository {
//   deleteMood(String moodId) {}
// }
