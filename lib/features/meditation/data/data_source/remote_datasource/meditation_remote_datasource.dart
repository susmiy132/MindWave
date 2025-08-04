import 'package:dio/dio.dart';
import 'package:mindwave/app/constant/api_endpoints.dart';
import 'package:mindwave/features/meditation/data/model/meditation_api_model.dart';
import 'package:mindwave/features/meditation/domain/entity/meditation_entity.dart';

import '../meditation_data_source.dart';

class MeditationRemoteDataSource implements MeditationDataSource {
  final Dio dio;

  MeditationRemoteDataSource({required this.dio});

  @override
  Future<List<MeditationEntity>> getAllMeditations() async {
    final response = await dio.get(ApiEndpoints.getAllMeditations);
    final List data = response.data;
    return data.map((json) => MeditationApiModel.fromJson(json).toEntity()).toList();
  }

  @override
  Future<void> createMeditation(MeditationEntity meditation) async {
    final meditationModel = MeditationApiModel.fromEntity(meditation);
    await dio.post(ApiEndpoints.createMeditation, data: meditationModel.toJson());
  }

  @override
  Future<void> deleteMeditation(String id) async {
    await dio.delete('${ApiEndpoints.deleteMeditation}/$id');
  }
}
