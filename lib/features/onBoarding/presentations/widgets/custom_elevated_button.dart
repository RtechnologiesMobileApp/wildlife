import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_rx/get_rx.dart';

class CustomElevatedButton extends StatelessWidget {
  final LinearGradient? gradient;
  final Color? bgColor;
  final double? radius;
  final double? height;
  final double? width;
  final VoidCallback? onClick;
  final Widget child;
  final BoxBorder? border;
  const CustomElevatedButton({
    super.key,
    this.gradient,
    this.bgColor,
    this.radius,
    this.height,
    this.onClick,
    required this.child,
    this.width,
    this.border
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height ?? 57.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: bgColor,
          gradient: gradient,
          borderRadius: BorderRadius.circular(radius ?? 14.r),
          border: border
        ),
        child: Center(child: child),
      ),
    );
  }
}
