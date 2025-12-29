import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/onBoarding/controller/onboarding_controller.dart';

class OnboardingData extends StatelessWidget {
  final PageController pageController;

  const OnboardingData({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final OnboardingController ctrl = Get.find<OnboardingController>();
    return PageView.builder(
      itemCount: ctrl.onboardingList.length,
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        ctrl.updateCurrentPage(index);
      },
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: 150,
              width: 300,
              child: Image.asset(
                ctrl.onboardingList[index].image,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: 50.h),
            Text(
              ctrl.onboardingList[index].title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                ctrl.onboardingList[index].desc,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
