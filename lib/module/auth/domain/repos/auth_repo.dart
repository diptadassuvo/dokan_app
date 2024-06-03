import 'package:dartz/dartz.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/auth/data/models/login_response.dart';
import 'package:dokan_app/module/auth/domain/entities/login_user_entity.dart';
import 'package:dokan_app/module/auth/domain/usecases/login.dart';
import 'package:dokan_app/module/auth/domain/usecases/signup.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginUserEntity>> login(LoginParams params);

  Future<bool> signup(SignupParam params);
}
