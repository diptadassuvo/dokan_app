import 'package:dartz/dartz.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/home/profile/domain/entities/profile_user_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileUserEntity>> loadProfile();

  Future<ProfileUserEntity> updateProfile(ProfileUserEntity profileUserEntity);
}
