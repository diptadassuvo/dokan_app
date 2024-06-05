import 'package:dokan_app/core/api/dio_clint.dart';
import 'package:dokan_app/module/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:dokan_app/module/auth/data/repos/auth_repo_impl.dart';
import 'package:dokan_app/module/auth/domain/usecases/login.dart';
import 'package:dokan_app/module/auth/domain/usecases/signup.dart';
import 'package:dokan_app/module/auth/presentation/login/cubit/login_cubit.dart';
import 'package:dokan_app/module/auth/presentation/signup/cubit/signup_cubit.dart';
import 'package:dokan_app/module/home/product/data/datasouces/products_local_datasource_impl.dart';
import 'package:dokan_app/module/home/product/data/repos/product_repo_impl.dart';
import 'package:dokan_app/module/home/product/domain/usecases/load_products.dart';
import 'package:dokan_app/module/home/product/presentation/cubit/products_cubit.dart';
import 'package:dokan_app/module/home/profile/data/dataSources/profile_remote_datasource_impl.dart';
import 'package:dokan_app/module/home/profile/data/repos/profile_repo_impl.dart';
import 'package:dokan_app/module/home/profile/domain/usecases/load_profile.dart';
import 'package:dokan_app/module/home/profile/presentation/cubit/profile_cubit.dart';
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

    // signup provider
    BlocProvider<SignupCubit>(
      create: (context) => SignupCubit(
        SignupUseCase(
          AuthRepoImpl(
            AuthRemoteDatasourceImpl(
              DioClient(),
            ),
          ),
        ),
      ),
    ),

    // product provider
    BlocProvider<ProductsCubit>(
      create: (context) => ProductsCubit(
        LoadProductsUsecase(
          ProductRepoImpl(
            ProductsLocalDatasourceImpl(),
          ),
        ),
      ),
    ),

    // profile provider
    BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit(
        LoadProfileUseCase(
          ProfileRepoImpl(
            ProfileRemoteDatasourceImpl(
              DioClient(),
            ),
          ),
        ),
      ),
    ),
  ];
}
