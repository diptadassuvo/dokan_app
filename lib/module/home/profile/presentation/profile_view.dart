import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends HookWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final isAccountExpanded = useState(false);
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Column(
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
            'User Name',
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff222455)),
          ),
          Text(
            'User Email',
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
                      headerBuilder: (BuildContext context, bool isOpen) => Row(
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
                          Text('1'),
                          Text('2'),
                          Text('3'),
                        ],
                      )),
                  ExpansionPanel(
                    canTapOnHeader: true,
                    backgroundColor: Colors.white,
                    headerBuilder: (BuildContext context, bool isOpen) => Row(
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
                    headerBuilder: (BuildContext context, bool isOpen) => Row(
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
                    headerBuilder: (BuildContext context, bool isOpen) => Row(
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
          )
        ],
      ),
    );
  }
}
