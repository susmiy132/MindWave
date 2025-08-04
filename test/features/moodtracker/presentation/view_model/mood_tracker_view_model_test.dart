import 'package:flutter_test/flutter_test.dart';
import 'package:mindwave/features/moodtracker/presentation/view_model/mood_tracker_evet.dart';
import 'package:mindwave/features/moodtracker/presentation/view_model/mood_tracker_view_model.dart';
import 'package:mindwave/features/moodtracker/domain/entity/mood_entity.dart';
import 'package:mindwave/features/moodtracker/presentation/view_model/mood_tracker_state.dart';

void main() {
  late MoodTrackerViewModel viewModel;

  setUp(() {
    viewModel = MoodTrackerViewModel();
  });

  test('initial state is MoodInitialState', () {
    expect(viewModel.state, isA<MoodInitialState>());
    expect(viewModel.selectedMoodLabel, isNull);
    expect(viewModel.selectedMoodEmoji, isNull);
    expect(viewModel.moodHistory, isEmpty);
  });

  test('selecting a mood updates state and adds to mood history', () {
    final moodLabel = 'Happy';

    bool notified = false;
    viewModel.addListener(() => notified = true);

    viewModel.onEvent(MoodSelectedEvent(moodLabel));

    expect(viewModel.selectedMoodLabel, moodLabel);
    expect(viewModel.selectedMoodEmoji, '😄');
    expect(viewModel.moodHistory.length, 1);
    expect(viewModel.moodHistory.first.moodLabel, moodLabel);
    expect(viewModel.state, isA<MoodSelectionSuccessState>());
    expect(notified, isTrue);
  });

  test('updateMood updates existing mood in history and notifies', () {
    // Add a mood first
    viewModel.onEvent(MoodSelectedEvent('Happy'));
    final originalMood = viewModel.moodHistory.first;

    bool notified = false;
    viewModel.addListener(() => notified = true);

    // Update mood
    viewModel.updateMood(
      originalMood.moodId!,
      'Relaxed',
      '😌',
    );

    final updatedMood = viewModel.moodHistory.first;
    expect(updatedMood.moodLabel, 'Relaxed');
    expect(updatedMood.moodEmoji, '😌');
    expect(updatedMood.moodDateTime, originalMood.moodDateTime);
    expect(notified, isTrue);
  });

  test('deleteMood removes mood from history and notifies', () {
    // Add a mood first
    viewModel.onEvent(MoodSelectedEvent('Happy'));
    final moodId = viewModel.moodHistory.first.moodId;

    bool notified = false;
    viewModel.addListener(() => notified = true);

    viewModel.deleteMood(moodId!);

    expect(viewModel.moodHistory, isEmpty);
    expect(notified, isTrue);
  });

  test('availableMoodOptions contains default moods', () {
    final options = viewModel.availableMoodOptions;

    expect(options.any((e) => e['label'] == 'Happy' && e['emoji'] == '😄'), isTrue);
    expect(options.any((e) => e['label'] == 'Sad' && e['emoji'] == '😢'), isTrue);
  });
}
