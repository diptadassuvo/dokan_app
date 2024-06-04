import 'package:dokan_app/module/auth/presentation/login/login_view.dart';
import 'package:dokan_app/module/auth/presentation/signup/signup_view.dart';
import 'package:dokan_app/module/home/product/presentation/products_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/products',
  redirect: (BuildContext context, GoRouterState state) {
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
    GoRoute(
        path: '/products', builder: (context, state) => const ProductsView()),
  ],
);
