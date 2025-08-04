// import 'package:flutter/material.dart';
// import 'package:mindwave/features/progress/domain/use_case/get_all_progress_usecase.dart';

// import 'progress_event.dart';
// import 'progress_state.dart';

// class ProgressViewModel extends ChangeNotifier {
//   final GetAllProgressUseCase getAllProgressUseCase;

//   ProgressViewModel(this.getAllProgressUseCase);

//   ProgressState _state = ProgressInitialState();
//   ProgressState get state => _state;

//   Future<void> onEvent(ProgressEvent event) async {
//     if (event is LoadProgressEvent) {
//       final data = await getAllProgressUseCase();
//       if (data.isEmpty) {
//         _state = ProgressEmptyState();
//       } else {
//         _state = ProgressLoadedState(data);
//       }
//       notifyListeners();
//     }
//   }
// }
