import 'package:mindwave/features/progress/domain/entity/progress_entity.dart';

abstract class ProgressEvent {}

class LoadProgressEvent extends ProgressEvent {}

class AddProgressEvent extends ProgressEvent {
  final ProgressEntity progress;

  AddProgressEvent(this.progress);
}
