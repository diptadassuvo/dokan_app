import 'package:dartz/dartz.dart';
import 'package:dokan_app/core/api/dio_clint.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/auth/data/datasources/auth_remote_datasource.dart';
import 'package:dokan_app/module/auth/data/models/login_response.dart';
import 'package:dokan_app/module/auth/domain/usecases/login.dart';
import 'package:dokan_app/module/auth/domain/usecases/signup.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDatasourceImpl(this._dioClient);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams params) async {
    final response = await _dioClient.postRequest(
      'https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token',
      data: params.toJson(),
      converter: (response) => LoginResponse.fromJson(response),
    );

    return response;
  }

  @override
  Future<Either<Failure, bool>> signup(SignupParam params) async {
    final response = await _dioClient.postRequest(
      'https://apptest.dokandemo.com/wp-json/wp/v2/users/register',
      data: params.toJson(),
      converter: (response) {
        return true;
      },
    );
    return response;
  }
}
