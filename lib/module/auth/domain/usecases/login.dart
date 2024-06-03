import 'package:dartz/dartz.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/auth/domain/entities/login_user_entity.dart';
import 'package:dokan_app/module/auth/domain/repos/auth_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';

part 'login.g.dart';

class LoginUseCase {
  final AuthRepo _authRepo;

  const LoginUseCase(this._authRepo);

  Future<Either<Failure, LoginUserEntity>> call(LoginParams params) {
    return _authRepo.login(params);
  }
}

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams(
      {required String username, required String password}) = _LoginParams;

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
