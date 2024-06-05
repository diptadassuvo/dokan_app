import 'package:dokan_app/core/constants/assets_path.dart';
import 'package:dokan_app/module/auth/presentation/login/cubit/login_cubit.dart';
import 'package:dokan_app/module/auth/presentation/widgets/social_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:go_router/go_router.dart';

class LoginView extends HookWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // form key
    final loginFormKey = GlobalKey<FormState>();
    // email controller
    final emailController = useTextEditingController();
    // passwordController
    final passwordController = useTextEditingController();
    // password visibility
    final isPasswordVisible = useState(false);

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 33.w),
        child: SingleChildScrollView(
          child: Form(
            key: loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 83.h,
                ),
                Image.asset(AssetsPath.logo, width: 165.w, height: 50.h),
                SizedBox(
                  height: 83.h,
                ),
                Text(
                  'Sign In',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                ),
                SizedBox(
                  height: 41.h,
                ),
                // email field
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: 'Username',
                  ),
                ),
                19.verticalSpace,
                // password field
                TextFormField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible.value,
                  keyboardType: TextInputType.text,
                  enableSuggestions: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          isPasswordVisible.value = !isPasswordVisible.value;
                        },
                        icon: Icon(isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility)),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xffA4A9AF),
                      ),
                    ),
                  ),
                ),
                60.verticalSpace,

                // sign in button
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      context.go('/home');
                    }
                    if (state is LoginFailed) {
                      //showtoast
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: HtmlWidget(
                            state.error,
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const CircularProgressIndicator();
                    }
                    return SizedBox(
                      height: 61.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!loginFormKey.currentState!.validate()) {
                            return;
                          }
                          context.read<LoginCubit>().login(
                              username: emailController.text,
                              password: passwordController.text);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            const Color(0xffF75F55),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    );
                  },
                ),

                // social options
                40.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialAuth(
                      child: Image.asset(AssetsPath.facebookLogo),
                    ),
                    14.horizontalSpace,
                    SocialAuth(
                      child: Image.asset(AssetsPath.googleLogo),
                    ),
                  ],
                ),
                40.verticalSpace,
                TextButton(
                  onPressed: () => context.go('/signup'),
                  child: Text(
                    'Create New Account',
                    style: TextStyle(
                      color: const Color(0xff383C40),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
