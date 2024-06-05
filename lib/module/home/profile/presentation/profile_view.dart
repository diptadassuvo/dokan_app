import 'package:dokan_app/module/home/profile/domain/usecases/update_profile.dart';
import 'package:dokan_app/module/home/profile/presentation/cubit/profile_cubit.dart';
import 'package:dokan_app/utils/services/hive/main_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends HookWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final isAccountExpanded = useState(false);
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF8F8F8),
        centerTitle: true,
        title: Text(
          'My Account',
          style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff222455)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                MainBoxMixin().removeData(MainBoxKeys.token);
                context.go('/login');
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message!)));
          }
        },
        builder: (context, state) {
          if (state is ProfileInitial || state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileLoaded) {
            // init text controllers values
            firstNameController.text = state.profileUserEntity.firstName ?? '';
            lastNameController.text = state.profileUserEntity.lastName ?? '';
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  50.verticalSpace,
                  Container(
                    height: 112.r,
                    width: 112.r,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  48.verticalSpace,
                  Text(
                    state.profileUserEntity.userName ?? 'username not found',
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff222455)),
                  ),
                  Text(
                    state.profileUserEntity.emailAddress ?? 'email not found',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff535353),
                    ),
                  ),
                  40.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 22.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: ExpansionPanelList(
                        materialGapSize: 0,
                        expansionCallback: (int index, bool isOpen) {
                          if (index == 0) {
                            isAccountExpanded.value = !isAccountExpanded.value;
                          }
                        },
                        elevation: 0,
                        dividerColor: const Color(0xffA0A9BD).withOpacity(0.3),
                        children: [
                          ExpansionPanel(
                              canTapOnHeader: true,
                              isExpanded: isAccountExpanded.value,
                              backgroundColor: Colors.white,
                              headerBuilder:
                                  (BuildContext context, bool isOpen) => Row(
                                        children: [
                                          const Icon(CupertinoIcons.person),
                                          8.horizontalSpace,
                                          Text(
                                            'Account',
                                            style: TextStyle(fontSize: 17.sp),
                                          )
                                        ],
                                      ),
                              body: Column(
                                children: [
                                  10.verticalSpace,
                                  TextFormField(
                                    initialValue:
                                        state.profileUserEntity.userName,
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Username',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  20.verticalSpace,
                                  TextFormField(
                                    initialValue:
                                        state.profileUserEntity.emailAddress,
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Email',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  20.verticalSpace,
                                  TextFormField(
                                    controller: firstNameController,
                                    decoration: const InputDecoration(
                                      labelText: 'First Name',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  20.verticalSpace,
                                  TextFormField(
                                    controller: lastNameController,
                                    decoration: const InputDecoration(
                                      labelText: 'Last Name',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Row(
                                    children: [
                                      Expanded(
                                          child: OutlinedButton(
                                        onPressed: () {
                                          isAccountExpanded.value = false;
                                        },
                                        child: const Text('Cancel'),
                                      )),
                                      20.horizontalSpace,
                                      Expanded(
                                          child: FilledButton(
                                        onPressed: () {
                                          context
                                              .read<ProfileCubit>()
                                              .updateProfile(
                                                UpdateProfileParams(
                                                  first_name:
                                                      firstNameController.text
                                                          .trim(),
                                                  last_name: lastNameController
                                                      .text
                                                      .trim(),
                                                ),
                                              );
                                          isAccountExpanded.value = false;
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                  const Color(0xff1ABC9C)),
                                        ),
                                        child: const Text('Save'),
                                      ))
                                    ],
                                  )
                                ],
                              )),
                          ExpansionPanel(
                            canTapOnHeader: true,
                            backgroundColor: Colors.white,
                            headerBuilder:
                                (BuildContext context, bool isOpen) => Row(
                              children: [
                                const Icon(CupertinoIcons.lock),
                                8.horizontalSpace,
                                Text(
                                  'Password',
                                  style: TextStyle(fontSize: 17.sp),
                                )
                              ],
                            ),
                            isExpanded: false,
                            body: const SizedBox(),
                          ),
                          ExpansionPanel(
                            canTapOnHeader: true,
                            backgroundColor: Colors.white,
                            headerBuilder:
                                (BuildContext context, bool isOpen) => Row(
                              children: [
                                const Icon(CupertinoIcons.bell),
                                8.horizontalSpace,
                                Text(
                                  'Notification',
                                  style: TextStyle(fontSize: 17.sp),
                                )
                              ],
                            ),
                            isExpanded: false,
                            body: const SizedBox(),
                          ),
                          ExpansionPanel(
                            canTapOnHeader: true,
                            backgroundColor: Colors.white,
                            headerBuilder:
                                (BuildContext context, bool isOpen) => Row(
                              children: [
                                const Icon(Icons.favorite_border),
                                8.horizontalSpace,
                                Text(
                                  'Wishlist',
                                  style: TextStyle(fontSize: 17.sp),
                                )
                              ],
                            ),
                            isExpanded: false,
                            body: const SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  40.verticalSpace,
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
