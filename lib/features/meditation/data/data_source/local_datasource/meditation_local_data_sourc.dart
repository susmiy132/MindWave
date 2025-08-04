// lib/features/meditation/data/data_source/local_data_source/meditation_local_data_source.dart

import 'package:hive/hive.dart';
import '../../../domain/entity/meditation_entity.dart';
import '../../model/meditation_hive_model.dart';
import '../meditation_data_source.dart';

class MeditationLocalDataSource implements MeditationDataSource {
  static const String boxName = 'meditationsBox';

  Future<Box<MeditationHiveModel>> _openBox() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(MeditationHiveModelAdapter());
    }
    return await Hive.openBox<MeditationHiveModel>(boxName);
  }

  @override
  Future<void> createMeditation(MeditationEntity meditation) async {
    final box = await _openBox();
    final model = MeditationHiveModel.fromEntity(meditation);
    await box.put(model.id, model);
  }

  @override
  Future<void> deleteMeditation(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }

  @override
  Future<List<MeditationEntity>> getAllMeditations() async {
    final box = await _openBox();
    final allMeditations = box.values.toList();
    return allMeditations.map((e) => e.toEntity()).toList();
  }
}
