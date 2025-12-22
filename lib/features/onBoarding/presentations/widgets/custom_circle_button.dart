import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomCircleButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).cardColor,
        ),
        child: Center(child: Icon(Icons.chevron_left, size: 32.sp)),
      ),
    );
  }
}
