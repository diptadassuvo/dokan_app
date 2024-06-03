import 'package:dokan_app/core/api/dio_clint.dart';
import 'package:dokan_app/module/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:dokan_app/module/auth/data/repos/auth_repo_impl.dart';
import 'package:dokan_app/module/auth/domain/usecases/login.dart';
import 'package:dokan_app/module/auth/presentation/login/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class BlocProviders {
  final List<BlocProvider> providers = [
    //login provider
    BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(
        LoginUseCase(
          AuthRepoImpl(
            AuthRemoteDatasourceImpl(
              DioClient(),
            ),
          ),
        ),
      ),
    ),
  ];
}
