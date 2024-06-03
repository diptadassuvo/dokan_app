import 'package:dartz/dartz.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/auth/domain/repos/auth_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup.freezed.dart';

part 'signup.g.dart';

class SignupUseCase {
  final AuthRepo _authRepo;

  const SignupUseCase(this._authRepo);

  Future<Either<Failure, bool>> call(SignupParam params) {
    return _authRepo.signup(params);
  }
}

@freezed
class SignupParam with _$SignupParam {
  const factory SignupParam(
      {required String username,
      required String email,
      required String password}) = _SignupParam;

  factory SignupParam.fromJson(Map<String, dynamic> json) =>
      _$SignupParamFromJson(json);
}
