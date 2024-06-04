import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dokan_app/module/home/product/presentation/products_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // indicate home active page index
    final homeIndex = useState(0);
    final homePages = [
      const ProductsView(),
      const Center(child: Text('page 2')),
      const Center(child: Text('Cart Page')),
      const Center(child: Text('profile')),
    ];
    return Scaffold(
      body: homePages.elementAt(homeIndex.value),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 56.r,
        width: 56.r,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffFF9472),
              Color(0xffF2709C),
            ],
          ),
        ),
        child: const Icon(
          CupertinoIcons.search,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          CupertinoIcons.home,
          Icons.grid_view_rounded,
          CupertinoIcons.cart,
          CupertinoIcons.person,
        ],
        inactiveColor: const Color(0xff6E7FAA),
        activeColor: const Color(0xffFF708A),
        activeIndex: homeIndex.value,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        rightCornerRadius: 20,
        leftCornerRadius: 20,
        backgroundColor: Colors.white,
        onTap: (int index) {
          homeIndex.value = index;
        },
        //other params
      ),
    );
  }
}
