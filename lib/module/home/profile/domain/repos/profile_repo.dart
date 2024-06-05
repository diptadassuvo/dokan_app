import 'package:dartz/dartz.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/home/profile/domain/entities/profile_user_entity.dart';
import 'package:dokan_app/module/home/profile/domain/usecases/update_profile.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileUserEntity>> loadProfile();

  Future<Either<Failure, ProfileUserEntity>> updateProfile(
      UpdateProfileParams params);
}
