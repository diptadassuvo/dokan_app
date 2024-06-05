import 'package:dartz/dartz.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/auth/data/datasources/auth_remote_datasource.dart';
import 'package:dokan_app/module/auth/domain/entities/login_user_entity.dart';
import 'package:dokan_app/module/auth/domain/repos/auth_repo.dart';
import 'package:dokan_app/module/auth/domain/usecases/login.dart';
import 'package:dokan_app/module/auth/domain/usecases/signup.dart';
import 'package:dokan_app/utils/services/hive/main_box.dart';

class AuthRepoImpl with MainBoxMixin implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  const AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<Either<Failure, LoginUserEntity>> login(LoginParams params) async {
    final response = await _authRemoteDataSource.login(params);
    return response.fold((l) => Left(l), (model) {
      addData(MainBoxKeys.token, model.token);
      return Right(model.toEntity());
    });
  }

  @override
  Future<Either<Failure, bool>> signup(SignupParam params) async {
    final response = await _authRemoteDataSource.signup(params);
    return response.fold((l) => Left(l), (r) => const Right(true));
  }
}
