import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputFieldWrapper extends StatelessWidget {
  const InputFieldWrapper({super.key, required this.inputField});

  final TextFormField inputField;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIconColor: Color(0xff7C8592),
          suffixIconColor: Color(0xff7C8592),
        ),
      ),
      child: Container(
        height: 61.h,
        decoration: BoxDecoration(
          // color: Colors.white,
          // borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff395AB8).withOpacity(0.10),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: inputField,
      ),
    );
  }
}
