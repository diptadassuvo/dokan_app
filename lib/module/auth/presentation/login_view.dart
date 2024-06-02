import 'package:dokan_app/core/constants/assets_path.dart';
import 'package:dokan_app/module/auth/presentation/widgets/social_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginView extends HookWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // email controller
    final _emailController = useTextEditingController();
    // passwordController
    final _passwordController = useTextEditingController();
    // password visibility
    final _isPasswordVisible = useState(false);

    // useEffect(() {}, []);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 33.w),
        child: SingleChildScrollView(
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
              ),
              SizedBox(
                height: 41.h,
              ),
              // email field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Email',
                ),
              ),
              19.verticalSpace,
              // password field
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible.value,
                keyboardType: TextInputType.text,
                enableSuggestions: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        _isPasswordVisible.value = !_isPasswordVisible.value;
                      },
                      icon: Icon(_isPasswordVisible.value
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
              SizedBox(
                height: 61.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
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
      )),
    );
  }
}
