import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/onBoarding/controller/onboarding_controller.dart';

class PageviewDots extends StatelessWidget {
  const PageviewDots({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController ctrl = Get.find<OnboardingController>();
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(ctrl.onboardingList.length, (index) {
          bool isActive = ctrl.currentPage == index;
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            height: 7.h,
            width: isActive ? 30.w : 7.w,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : AppColors.softgreen,
              borderRadius: BorderRadius.circular(10.0.r),
            ),
          );
        }),
      ),
    );
  }
}
