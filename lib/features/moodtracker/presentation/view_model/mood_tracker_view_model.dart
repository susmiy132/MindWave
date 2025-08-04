// // // lib/features/moodtracker/presentation/view_model/mood_tracker_view_model.dart

// // import 'package:flutter/material.dart';
// // import 'package:mindwave/features/moodtracker/presentation/view_model/mood_tracker_evet.dart';
// // import 'mood_tracker_state.dart';
// // import 'package:mindwave/features/moodtracker/domain/entity/mood_entity.dart';

// // class MoodTrackerViewModel extends ChangeNotifier {
// //   MoodTrackerState _state = MoodInitialState();
// //   MoodTrackerState get state => _state;

// //   String? _selectedMoodLabel;
// //   String? _selectedMoodEmoji;
// //   List<MoodEntity> _moodHistory = [];

// //   final List<Map<String, String>> moodOptions = [
// //     {"emoji": "😄", "label": "Happy"},
// //     {"emoji": "😢", "label": "Sad"},
// //     {"emoji": "😠", "label": "Angry"},
// //     {"emoji": "😌", "label": "Relaxed"},
// //     {"emoji": "😰", "label": "Anxious"},
// //   ];

// //   void onEvent(MoodTrackerEvent event) {
// //     if (event is MoodSelectedEvent) {
// //       _handleMoodSelected(event.moodLabel);
// //     }
// //   }

// //   void _handleMoodSelected(String moodLabel) {
// //     final moodOption = moodOptions.firstWhere(
// //       (option) => option['label'] == moodLabel,
// //       orElse: () => {"label": moodLabel, "emoji": "🙂"},
// //     );

// //     _selectedMoodLabel = moodOption['label'];
// //     _selectedMoodEmoji = moodOption['emoji'];

// //     _moodHistory.insert(
// //       0,
// //       MoodEntity(
// //         moodId: UniqueKey().toString(),
// //         moodLabel: _selectedMoodLabel!,
// //         moodEmoji: _selectedMoodEmoji!,
// //         moodDateTime: DateTime.now(),
// //       ),
// //     );

// //     _state = MoodSelectionSuccessState(
// //       selectedMoodLabel: _selectedMoodLabel!,
// //       selectedMoodEmoji: _selectedMoodEmoji!,
// //       moodHistory: List.unmodifiable(_moodHistory),
// //     );

// //     notifyListeners();
// //   }

// //   String? get selectedMoodLabel => _selectedMoodLabel;
// //   String? get selectedMoodEmoji => _selectedMoodEmoji;

// //   List<MoodEntity> get moodHistory => List.unmodifiable(_moodHistory);

// //   List<Map<String, String>> get availableMoodOptions => moodOptions;

// //   void updateMood(String? moodId, String trim, String trim2) {}
// // }


// import 'package:flutter/material.dart';
// import 'package:mindwave/features/moodtracker/presentation/view_model/mood_tracker_evet.dart';
// import 'mood_tracker_state.dart';
// import 'package:mindwave/features/moodtracker/domain/entity/mood_entity.dart';

// class MoodTrackerViewModel extends ChangeNotifier {
//   MoodTrackerState _state = MoodInitialState();
//   MoodTrackerState get state => _state;

//   String? _selectedMoodLabel;
//   String? _selectedMoodEmoji;
//   final List<MoodEntity> _moodHistory = [];

//   final List<Map<String, String>> moodOptions = [
//     {"emoji": "😄", "label": "Happy"},
//     {"emoji": "😢", "label": "Sad"},
//     {"emoji": "😠", "label": "Angry"},
//     {"emoji": "😌", "label": "Relaxed"},
//     {"emoji": "😰", "label": "Anxious"},
//   ];

//   void onEvent(MoodTrackerEvent event) {
//     if (event is MoodSelectedEvent) {
//       _handleMoodSelected(event.moodLabel);
//     }
//   }

//   void _handleMoodSelected(String moodLabel) {
//     final moodOption = moodOptions.firstWhere(
//       (option) => option['label'] == moodLabel,
//       orElse: () => {"label": moodLabel, "emoji": "🙂"},
//     );

//     _selectedMoodLabel = moodOption['label'];
//     _selectedMoodEmoji = moodOption['emoji'];

//     _moodHistory.insert(
//       0,
//       MoodEntity(
//         moodId: UniqueKey().toString(),
//         moodLabel: _selectedMoodLabel!,
//         moodEmoji: _selectedMoodEmoji!,
//         moodDateTime: DateTime.now(),
//       ),
//     );

//     _state = MoodSelectionSuccessState(
//       selectedMoodLabel: _selectedMoodLabel!,
//       selectedMoodEmoji: _selectedMoodEmoji!,
//       moodHistory: List.unmodifiable(_moodHistory),
//     );

//     notifyListeners();
//   }

//   void updateMood(String moodId, String newLabel, String newEmoji) {
//     final index = _moodHistory.indexWhere((mood) => mood.moodId == moodId);
//     if (index != -1) {
//       _moodHistory[index] = MoodEntity(
//         moodId: moodId,
//         moodLabel: newLabel,
//         moodEmoji: newEmoji,
//         moodDateTime: _moodHistory[index].moodDateTime,
//       );
//       notifyListeners();
//     }
//   }

//   void deleteMood(String moodId) {
//     _moodHistory.removeWhere((mood) => mood.moodId == moodId);
//     notifyListeners();
//   }

//   String? get selectedMoodLabel => _selectedMoodLabel;
//   String? get selectedMoodEmoji => _selectedMoodEmoji;

//   List<MoodEntity> get moodHistory => List.unmodifiable(_moodHistory);

//   List<Map<String, String>> get availableMoodOptions => moodOptions;
// }
