import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Coming',
            style: TextStyle(
              fontSize: 48.sp,
              height: 0,
              fontWeight: FontWeight.w700,
              color: const Color(0xffFF708A),
            ),
          ),
          Text(
            'Soon',
            style: TextStyle(
              fontSize: 74.sp,
              height: 0,
              fontWeight: FontWeight.w900,
              color: const Color(0xffFF708A),
            ),
          ),
        ],
      ),
    );
  }
}
