// lib/features/meditation/data/repository/meditation_local_repository.dart

import 'package:mindwave/features/meditation/data/data_source/meditation_data_source.dart';

import '../../../domain/entity/meditation_entity.dart';
import '../../../domain/repository/meditation_repository.dart';

class MeditationLocalRepository implements MeditationRepository {
  final MeditationDataSource dataSource;

  MeditationLocalRepository(this.dataSource);

  @override
  Future<void> createMeditation(MeditationEntity meditation) {
    return dataSource.createMeditation(meditation);
  }

  @override
  Future<void> deleteMeditation(String id) {
    return dataSource.deleteMeditation(id);
  }

  @override
  Future<List<MeditationEntity>> getAllMeditations() {
    return dataSource.getAllMeditations();
  }
}
