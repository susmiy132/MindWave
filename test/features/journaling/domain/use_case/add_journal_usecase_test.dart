// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';
// import 'package:mindwave/features/journaling/domain/repository/journal_repository.dart';
// import 'package:mindwave/features/journaling/domain/use_case/add_journal_usecase.dart';

// // Mock repository
// class MockJournalRepository extends Mock implements JournalRepository {}

// void main() {
//   late MockJournalRepository mockJournalRepository;
//   late AddJournalUseCase addJournalUseCase;

//   final testJournal = JournalEntity(
//     dateTime: null,
//     journalTitle: '',
//     journalmood: '',
//     place: '',
//     weather: '',
//     journalImage: '',
//     journalContent: '',
//   );

//   setUpAll(() {
//     // ✅ Register fallback value for JournalEntity
//     registerFallbackValue(testJournal);
//   });

//   setUp(() {
//     mockJournalRepository = MockJournalRepository();
//     addJournalUseCase = AddJournalUseCase(mockJournalRepository);
//   });

//   test('should call repository to add journal', () async {
//     // Arrange
//     when(() => mockJournalRepository.addJournal(any()))
//         .thenAnswer((_) async {});

//     // Act
//     await addJournalUseCase(testJournal);

//     // Assert
//     verify(() => mockJournalRepository.addJournal(testJournal)).called(1);
//   });
// }
