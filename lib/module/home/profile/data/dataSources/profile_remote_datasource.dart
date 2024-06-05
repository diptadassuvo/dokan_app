import 'package:dartz/dartz.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/home/profile/data/models/user_profile_model.dart';
import 'package:dokan_app/module/home/profile/domain/usecases/update_profile.dart';

abstract class ProfileRemoteDatasource {
  Future<Either<Failure, UserProfileModel>> loadProfile();

  Future<void> updateProfile(UpdateProfileParams profileUserEntity);
}
