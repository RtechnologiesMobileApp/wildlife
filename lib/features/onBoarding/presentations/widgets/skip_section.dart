import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/onBoarding/controller/onboarding_controller.dart';
import 'package:wildlife/features/onBoarding/presentations/widgets/custom_circle_button.dart';

class SkipSection extends StatelessWidget {
  final VoidCallback skipMethod;
  final VoidCallback backMethod;

  const SkipSection({
    super.key,
    required this.skipMethod,
    required this.backMethod,
  });

  @override
  Widget build(BuildContext context) {
    final OnboardingController ctrl = Get.find<OnboardingController>();
    return SizedBox(
      height: 32.h,
      child: Obx(
        () => Row(
          children: [
            ctrl.currentPage != 0
                ? CustomCircleButton(onTap: backMethod)
                : SizedBox(height: 32.h),
            Spacer(),
            ctrl.currentPage != ctrl.onboardingList.length - 1
                ? GestureDetector(
                    onTap: skipMethod,
                    child: Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                  )
                : SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
