import 'package:dokan_app/app/app_router.dart';
import 'package:dokan_app/core/config/bloc_providers.dart';
import 'package:dokan_app/core/config/getit.dart';
import 'package:dokan_app/core/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getIt<BlocProviders>().providers,
      child: ScreenUtilInit(
          designSize: const Size(430, 932),
          builder: (_, child) {
            return MaterialApp.router(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.baseTheme,
              routerConfig: appRouter,
            );
          }),
    );
  }
}
