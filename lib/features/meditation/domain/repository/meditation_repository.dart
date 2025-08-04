// lib/features/meditation/domain/repository/meditation_repository.dart

import '../entity/meditation_entity.dart';

abstract class MeditationRepository {
  Future<List<MeditationEntity>> getAllMeditations();
  Future<void> createMeditation(MeditationEntity meditation);
  Future<void> deleteMeditation(String id);
}
