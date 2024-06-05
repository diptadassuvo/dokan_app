import 'package:dartz/dartz.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/home/profile/domain/entities/profile_user_entity.dart';
import 'package:dokan_app/module/home/profile/domain/repos/profile_repo.dart';

class LoadProfileUseCase {
  final ProfileRepo _profileRepo;

  const LoadProfileUseCase(this._profileRepo);

  Future<Either<Failure, ProfileUserEntity>> call() async {
    return _profileRepo.loadProfile();
  }
}
