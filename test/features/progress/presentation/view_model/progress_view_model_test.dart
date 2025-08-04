import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mindwave/features/progress/domain/use_case/get_all_progress_usecase.dart';
import 'package:mindwave/features/progress/presentation/view_model/progress_event.dart';
import 'package:mindwave/features/progress/presentation/view_model/progress_state.dart';
import 'package:mindwave/features/progress/presentation/view_model/progress_view_model.dart';

// Mock class for GetAllProgressUseCase
class MockGetAllProgressUseCase extends Mock implements GetAllProgressUseCase {}

void main() {
  late MockGetAllProgressUseCase mockUseCase;
  late ProgressViewModel viewModel;

  setUp(() {
    mockUseCase = MockGetAllProgressUseCase();
    viewModel = ProgressViewModel(mockUseCase);
  });

  test('Initial state is ProgressInitialState', () {
    expect(viewModel.state, isA<ProgressInitialState>());
  });

  test('onEvent with LoadProgressEvent emits ProgressEmptyState when data is empty', () async {
    // Arrange: make the use case return empty list
    when(() => mockUseCase()).thenAnswer((_) async => []);

    // Listen for notifyListeners call
    var notified = false;
    viewModel.addListener(() {
      notified = true;
    });

    // Act
    await viewModel.onEvent(LoadProgressEvent());

    // Assert
    expect(viewModel.state, isA<ProgressEmptyState>());
    expect(notified, isTrue);
  });

//   test('onEvent with LoadProgressEvent emits ProgressLoadedState when data is not empty', () async {
//     // Arrange: sample data
//     final sampleData = ['progress1', 'progress2'];
//     when(() => mockUseCase()).thenAnswer((_) async => sampleData);

//     var notified = false;
//     viewModel.addListener(() {
//       notified = true;
//     });

//     // Act
//     await viewModel.onEvent(LoadProgressEvent());

//     // Assert
//     expect(viewModel.state, isA<ProgressLoadedState>());
//     expect((viewModel.state as ProgressLoadedState).progressData, sampleData);
//     expect(notified, isTrue);
//   });


}
