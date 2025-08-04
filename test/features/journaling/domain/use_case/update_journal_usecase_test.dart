// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';
// import 'package:mindwave/features/journaling/domain/repository/journal_repository.dart';
// import 'package:mindwave/features/journaling/domain/use_case/update_journal_usecase.dart';

// // Mock repository
// class MockJournalRepository extends Mock implements JournalRepository {}

// void main() {
//   late MockJournalRepository mockJournalRepository;
//   late UpdateJournalUseCase updateJournalUseCase;

//   final testJournal = JournalEntity(
//     dateTime: DateTime.now(),
//     journalTitle: 'Updated Title',
//     journalmood: 'Content',
//     place: 'Park',
//     weather: 'Cloudy',
//     journalImage: 'updated.png',
//     journalContent: 'Updated content',
//   );

//   setUpAll(() {
//     registerFallbackValue(testJournal); // Required by mocktail for any()
//   });

//   setUp(() {
//     mockJournalRepository = MockJournalRepository();
//     updateJournalUseCase = UpdateJournalUseCase(mockJournalRepository);
//   });

//   test('should call repository to update journal', () async {
//     // Arrange
//     when(() => mockJournalRepository.updateJournal(any()))
//         .thenAnswer((_) async {});

//     // Act
//     await updateJournalUseCase(testJournal);

//     // Assert
//     verify(() => mockJournalRepository.updateJournal(testJournal)).called(1);
//   });
// }
