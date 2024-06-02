import 'package:dokan_app/module/auth/presentation/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  redirect: (BuildContext context, GoRouterState state) {
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
  ],
);
