import 'package:flutter_test/flutter_test.dart';
import 'package:mindwave/features/journaling/domain/use_case/get_journal_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mindwave/features/journaling/domain/entity/journal_entity.dart';
import 'package:mindwave/features/journaling/domain/repository/journal_repository.dart';

class MockJournalRepository extends Mock implements JournalRepository {}

void main() {
  late MockJournalRepository mockJournalRepository;
  late GetJournalUseCase getJournalUseCase;

  final testJournal = JournalEntity(
    dateTime: DateTime.now(),
    journalTitle: 'Test Title',
    journalmood: 'Happy',
    place: 'Home',
    weather: 'Sunny',
    journalImage: 'image.png',
    journalContent: 'Test content',
  );

  setUpAll(() {
    registerFallbackValue(testJournal);
  });

  setUp(() {
    mockJournalRepository = MockJournalRepository();
    getJournalUseCase = GetJournalUseCase(mockJournalRepository);
  });

  test('should call repository to save journal', () async {
    when(() => mockJournalRepository.saveJournal(any()))
        .thenAnswer((_) async {});

    await getJournalUseCase(testJournal);

    verify(() => mockJournalRepository.saveJournal(testJournal)).called(1);
  });
}
