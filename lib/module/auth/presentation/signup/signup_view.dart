import 'package:dokan_app/core/constants/assets_path.dart';
import 'package:dokan_app/module/auth/domain/usecases/signup.dart';
import 'package:dokan_app/module/auth/presentation/signup/cubit/signup_cubit.dart';
import 'package:dokan_app/module/auth/presentation/widgets/input_field_wrapper.dart';
import 'package:dokan_app/module/auth/presentation/widgets/social_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupView extends HookWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    // form key
    final signupFormKey = GlobalKey<FormState>();

    // name controller
    final nameController = useTextEditingController();
    // email controller
    final emailController = useTextEditingController();
    // passwordController
    final passwordController = useTextEditingController();

    // confirm password controller
    final confirmPasswordController = useTextEditingController();

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 33.w),
        child: SingleChildScrollView(
          child: Form(
            key: signupFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                52.verticalSpace,
                const ProfileImagePicker(),
                50.verticalSpace,
                // name field
                InputFieldWrapper(
                  inputField: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      if (value.length < 3) {
                        return 'Name must be at least 3 characters';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: 'Name',
                    ),
                  ),
                ),
                19.verticalSpace,
                // email field
                InputFieldWrapper(
                  inputField: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                    ),
                  ),
                ),
                19.verticalSpace,
                // password field
                InputFieldWrapper(
                  inputField: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: 'Password',
                    ),
                  ),
                ),
                19.verticalSpace,
                // confirm password field
                InputFieldWrapper(
                  inputField: TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: 'Confirm Password',
                    ),
                  ),
                ),

                78.verticalSpace,

                // sign in button
                BlocConsumer<SignupCubit, SignupState>(
                  listener: (context, state) {
                    if (state is SignupSuccess) {
                      context.go('/login');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Signup Successful! Login to continue'),
                        ),
                      );
                    }
                    if (state is SignupError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is SignupLoading) {
                      return const CircularProgressIndicator();
                    }
                    return SizedBox(
                      height: 61.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!signupFormKey.currentState!.validate()) {
                            return;
                          }
                          context.read<SignupCubit>().signup(SignupParam(
                                username: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              ));
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            const Color(0xffF75F55),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: const Color(0xff383C40),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.go('/login'),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: const Color(0xff2893E3),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120.r,
          width: 120.r,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff395AB8).withOpacity(0.10),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ]),
          child: const Icon(
            Icons.person_outlined,
            size: 28,
            color: Color(0xff7C8592),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 34.r,
            width: 34.r,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffFF9472),
                    Color(0xffF2709C),
                  ],
                )),
            child: const Icon(
              Icons.camera_alt,
              size: 15,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ],
    );
  }
}
