// import 'package:mindwave/features/meditation/data/data_source/remote_datasource/meditation_remote_datasource.dart';
// import 'package:mindwave/features/meditation/domain/entity/meditation_entity.dart';
// import 'package:mindwave/features/meditation/domain/repository/meditation_repository.dart';

// class MeditationRepositoryImpl implements MeditationRepository {
//   final MeditationRemoteDataSource remoteDataSource;

//   MeditationRepositoryImpl({required this.remoteDataSource});

//   @override
//   Future<List<MeditationEntity>> getAllMeditations() async {
//     try {
//       return await remoteDataSource.getAllMeditations();
//     } catch (e) {
//       rethrow; // optionally handle/log error here
//     }
//   }

//   @override
//   Future<void> createMeditation(MeditationEntity meditation) async {
//     try {
//       await remoteDataSource.createMeditation(meditation);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<void> deleteMeditation(String id) async {
//     try {
//       await remoteDataSource.deleteMeditation(id);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
