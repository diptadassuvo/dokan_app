import 'package:dartz/dartz.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/home/profile/data/dataSources/profile_remote_datasource.dart';
import 'package:dokan_app/module/home/profile/domain/entities/profile_user_entity.dart';
import 'package:dokan_app/module/home/profile/domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDatasource _profileRemoteDatasource;

  ProfileRepoImpl(this._profileRemoteDatasource);

  @override
  Future<Either<Failure, ProfileUserEntity>> loadProfile() async {
    final response = await _profileRemoteDatasource.loadProfile();
    return response.fold((l) => Left(l), (data) {
      // convert to entity
      return Right(ProfileUserEntity(
        userName: data.userName,
        firstName: data.firstName,
        lastName: data.lastName,
        emailAddress: data.emailAddress,
      ));
    });
  }

  @override
  Future<ProfileUserEntity> updateProfile(ProfileUserEntity profileUserEntity) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
