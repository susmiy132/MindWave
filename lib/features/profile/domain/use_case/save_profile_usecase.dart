// lib/features/profile/domain/usecases/save_profile_usecase.dart

import 'package:mindwave/features/profile/domain/entity/profile_entity.dart';
import 'package:mindwave/features/profile/domain/repository/profile_repository.dart';

class SaveProfileUseCase {
  final ProfileRepository repository;

  SaveProfileUseCase(this.repository);

  Future<void> call(ProfileEntity profile) async {
    await repository.saveProfile(profile);
  }
}
