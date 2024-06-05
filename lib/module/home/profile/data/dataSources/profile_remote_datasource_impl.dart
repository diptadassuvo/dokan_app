import 'package:dartz/dartz.dart';
import 'package:dokan_app/core/api/dio_clint.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/home/profile/data/dataSources/profile_remote_datasource.dart';
import 'package:dokan_app/module/home/profile/data/models/user_profile_model.dart';
import 'package:dokan_app/module/home/profile/domain/usecases/update_profile.dart';

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final DioClient _dioClient;

  const ProfileRemoteDatasourceImpl(this._dioClient);

  @override
  Future<Either<Failure, UserProfileModel>> loadProfile() async {
    // calling POST API cause get call give us less data!
    final response = await _dioClient.postRequest(
      '/wp/v2/users/me',
      converter: (response) => UserProfileModel.fromJson(response),
    );

    return response.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Failure, UserProfileModel>> updateProfile(
      UpdateProfileParams params) async {
    final response = await _dioClient.postRequest(
      '/wp/v2/users/me',
      data: params.toJson(),
      converter: (response) => UserProfileModel.fromJson(response),
    );

    return response;
  }
}
