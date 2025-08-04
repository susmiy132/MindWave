
abstract class MoodTrackerEvent {}

class MoodSelectedEvent extends MoodTrackerEvent {
  final String moodLabel;

  MoodSelectedEvent(this.moodLabel);
}
