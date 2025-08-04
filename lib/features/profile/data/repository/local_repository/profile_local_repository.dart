// lib/features/profile/data/repository/profile_repository_impl.dart

import 'package:mindwave/features/profile/data/data_source/profile_data_source.dart';
import 'package:mindwave/features/profile/domain/entity/profile_entity.dart';
import 'package:mindwave/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource localDataSource;

  ProfileRepositoryImpl({required this.localDataSource});

  @override
  Future<ProfileEntity?> getProfile(String userId) async {
    return await localDataSource.getProfile(userId);
  }

  @override
  Future<void> saveProfile(ProfileEntity profile) async {
    await localDataSource.saveProfile(profile);
  }

  @override
  Future<void> deleteProfile(String userId) async {
    await localDataSource.deleteProfile(userId);
  }
}
