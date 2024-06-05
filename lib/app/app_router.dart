import 'package:dokan_app/module/auth/presentation/login/login_view.dart';
import 'package:dokan_app/module/auth/presentation/signup/signup_view.dart';
import 'package:dokan_app/module/home/home_view.dart';
import 'package:dokan_app/module/home/product/domain/entities/product_entity.dart';
import 'package:dokan_app/module/home/product/presentation/product_details_view.dart';
import 'package:dokan_app/utils/services/hive/main_box.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  redirect: (BuildContext context, GoRouterState state) {
    final bool isLoggedIn = MainBoxMixin().getData(MainBoxKeys.token) != null;

    if (state.uri.toString() == '/home' && !isLoggedIn) {
      return '/login';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomeView()),
    GoRoute(
      path: '/product',
      builder: (context, state) {
        final productEntity = state.extra as ProductEntity;
        return ProductDetailsView(productEntity: productEntity);
      },
    ),
  ],
);
