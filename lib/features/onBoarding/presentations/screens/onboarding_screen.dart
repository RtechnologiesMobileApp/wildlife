import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/onBoarding/controller/onboarding_controller.dart';
import 'package:wildlife/features/onBoarding/presentations/screens/on_boarding_screen.dart';
import 'package:wildlife/features/onBoarding/presentations/widgets/custom_elevated_button.dart';
import 'package:wildlife/features/onBoarding/presentations/widgets/onboarding_data.dart';
import 'package:wildlife/features/onBoarding/presentations/widgets/pageview_dots.dart';
import 'package:wildlife/features/onBoarding/presentations/widgets/skip_section.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController ctrl = Get.isRegistered<OnboardingController>()
      ? Get.find<OnboardingController>()
      : Get.put(OnboardingController());

  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ctrl.updateCurrentPage(0);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SkipSection(
              skipMethod: () {
                pageController.jumpToPage(ctrl.onboardingList.length - 1);
              },
              backMethod: () {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            SizedBox(height: 173.h),
            Expanded(
              // height: 350.h,
              child: OnboardingData(pageController: pageController),
            ),
            SizedBox(height: 50.h),
            PageviewDots(),
            SizedBox(height: 20),
            CustomElevatedButton(
              gradient: AppColors.redLinearGradient,
              onClick: () {
                ctrl.currentPage != ctrl.onboardingList.length - 1
                    ? pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                    : Get.off(() => GetStartedScreen());
              },
              child: Obx(
                () => Text(
                  ctrl.currentPage == ctrl.onboardingList.length - 1
                      ? 'Get Started'
                      : 'Next',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
