import 'package:get/get.dart';
import 'package:wildlife/config/constants/images.dart';
import 'package:wildlife/features/onBoarding/model/onboarding_model.dart';

// class OnboardingController extends GetxController {
//   final _currentPage = 2.obs;

//   int get currentPage => _currentPage.value;

//   void updateCurrentPage(int value) {
//     _currentPage.value = value;
//   }

//   final onboardingList = [
//     OnboardingModel(
//       image: AppImages.onBoard1,
//       title: 'Help Wildlife When It Matters Most',
//       desc:
//           'WildHelp connects caring people with licensed wildlife professionals to give injured and orphaned animals the help they need—fast and safely.',
//     ),
//     OnboardingModel(
//       image: AppImages.onBoard2,
//       title: 'Report Injured Wildlife in Seconds',
//       desc:
//           'Found a bird, mammal, or reptile in distress? Quickly share basic details and your location so nearby wildlife rehab centers can respond.',
//     ),
//     OnboardingModel(
//       image: AppImages.onBoard3,
//       title: 'Connect With Licensed Wildlife Clinics',
//       desc:
//           'Your report is sent privately to verified wildlife hospitals near you—no public maps, no exposure—just direct help from trained experts.',
//     ),
//   ];
// }

class OnboardingController extends GetxController {
  final RxInt _currentPage = 0.obs;

  int get currentPage => _currentPage.value;

  void updateCurrentPage(int value) {
    _currentPage.value = value;
  }

  final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: AppImages.onBoard1,
      title: 'Help Wildlife When It Matters Most',
      desc:
          'WildHelp connects caring people with licensed wildlife professionals to give injured and orphaned animals the help they need—fast and safely.',
    ),
    OnboardingModel(
      image: AppImages.onBoard2,
      title: 'Report Injured Wildlife in Seconds',
      desc:
          'Found a bird, mammal, or reptile in distress? Quickly share basic details and your location so nearby wildlife rehab centers can respond.',
    ),
    OnboardingModel(
      image: AppImages.onBoard3,
      title: 'Connect With Licensed Wildlife Clinics',
      desc:
          'Your report is sent privately to verified wildlife hospitals near you—no public maps, no exposure—just direct help from trained experts.',
    ),
  ];
}
