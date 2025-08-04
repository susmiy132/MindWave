import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'meditation_record_event.dart';
import 'meditation_record_state.dart';

class MeditationRecordViewModel extends Bloc<MeditationRecordEvent, MeditationRecordState> {
  Timer? _timer;

  MeditationRecordViewModel({required String title, required String duration})
      : super(MeditationRecordState.initial(title, duration)) {
    on<StartMeditation>(_onStart);
    on<Tick>(_onTick);
    on<StopMeditation>(_onStop);
  }

  void _onStart(StartMeditation event, Emitter<MeditationRecordState> emit) {
    if (state.isRunning) return;

    emit(state.copyWith(isRunning: true));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(Tick());
    });
  }

  void _onTick(Tick event, Emitter<MeditationRecordState> emit) {
    if (state.remainingSeconds <= 1) {
      _timer?.cancel();
      emit(state.copyWith(isRunning: false, remainingSeconds: 0));
    } else {
      emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
    }
  }

  void _onStop(StopMeditation event, Emitter<MeditationRecordState> emit) {
    _timer?.cancel();
    emit(state.copyWith(isRunning: false));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
