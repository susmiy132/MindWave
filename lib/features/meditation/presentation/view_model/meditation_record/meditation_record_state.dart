import 'package:equatable/equatable.dart';

class MeditationRecordState extends Equatable {
  final bool isRunning;
  final int remainingSeconds;
  final String title;
  final String duration;

  const MeditationRecordState({
    required this.isRunning,
    required this.remainingSeconds,
    required this.title,
    required this.duration,
  });

  factory MeditationRecordState.initial(String title, String duration) {
    return MeditationRecordState(
      isRunning: false,
      remainingSeconds: _parseDurationToSeconds(duration),
      title: title,
      duration: duration,
    );
  }

  MeditationRecordState copyWith({
    bool? isRunning,
    int? remainingSeconds,
    String? title,
    String? duration,
  }) {
    return MeditationRecordState(
      isRunning: isRunning ?? this.isRunning,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      title: title ?? this.title,
      duration: duration ?? this.duration,
    );
  }

  static int _parseDurationToSeconds(String duration) {
    final parts = duration.split(' ');
    final value = int.tryParse(parts[0]) ?? 0;
    return value * 60;
  }

  @override
  List<Object?> get props => [isRunning, remainingSeconds, title, duration];
}
