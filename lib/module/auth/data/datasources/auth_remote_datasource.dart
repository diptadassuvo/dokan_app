import 'package:dartz/dartz.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/auth/data/models/login_response.dart';
import 'package:dokan_app/module/auth/data/models/signup_response.dart';
import 'package:dokan_app/module/auth/domain/usecases/login.dart';
import 'package:dokan_app/module/auth/domain/usecases/signup.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, LoginResponse>> login(LoginParams params);

  Future<Either<Failure, SignupResponse>> signup(SignupParam params);
}