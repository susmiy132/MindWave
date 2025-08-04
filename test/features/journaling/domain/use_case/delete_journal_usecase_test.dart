// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:mindwave/features/journaling/domain/repository/journal_repository.dart';
// import 'package:mindwave/features/journaling/domain/use_case/delete_journal_usecase.dart';

// // Mock class
// class MockJournalRepository extends Mock implements JournalRepository {}

// void main() {
//   late MockJournalRepository mockJournalRepository;
//   late DeleteJournalUseCase deleteJournalUseCase;

//   const testJournalId = 'journal123';

//   setUp(() {
//     mockJournalRepository = MockJournalRepository();
//     deleteJournalUseCase = DeleteJournalUseCase(mockJournalRepository);
//   });

//   test('should call repository to delete journal', () async {
//     // Arrange
//     when(() => mockJournalRepository.deleteJournal(any()))
//         .thenAnswer((_) async {});

//     // Act
//     await deleteJournalUseCase(testJournalId);

//     // Assert
//     verify(() => mockJournalRepository.deleteJournal(testJournalId)).called(1);
//   });
// }
