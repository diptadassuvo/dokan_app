import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A widget for displaying social authentication buttons.
///
/// This widget provides a container with rounded corners and a shadow effect, typically used for social authentication buttons.
/// It accepts a child widget to display within the container, which is usually an icon or an image representing a social media platform.
/// If an [onPressed] function is provided, the container becomes tappable, allowing users to interact with it.
class SocialAuth extends StatelessWidget {
  /// Constructs a [SocialAuth] widget.
  ///
  /// The [child] parameter is required and represents the widget to be displayed within the container.
  /// The [onPressed] parameter is optional and specifies the function to be called when the container is tapped.
  const SocialAuth({Key? key, required this.child, this.onPressed})
      : super(key: key);

  /// The widget to be displayed within the container.
  final Widget child;

  /// The function to be called when the container is tapped.
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.r,
      width: 56.r,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff395AB8).withOpacity(0.10),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: onPressed == null
          ? child
          : GestureDetector(
              onTap: onPressed,
              child: child,
            ),
    );
  }
}
