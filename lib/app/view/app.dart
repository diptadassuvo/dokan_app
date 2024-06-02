import 'package:dokan_app/app/app_router.dart';
import 'package:dokan_app/module/auth/presentation/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (_, child) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: appRouter,
          );
        });
  }
}
