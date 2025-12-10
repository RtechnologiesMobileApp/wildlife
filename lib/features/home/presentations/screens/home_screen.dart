import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/features/firstAid/presentations/screens/first_aid_tips_screen.dart';
import 'package:wildlife/features/home/presentations/widgets/home_card_widgets.dart';
import 'package:wildlife/features/injuredanimal/presentations/screens/injuried_animal_report_screen.dart';
import 'package:wildlife/features/wildlifeclinic/presentations/screens/wildlife_clinic_screen.dart';
import 'package:wildlife/features/home/presentations/screens/user_profile_screen.dart';
import 'package:wildlife/features/home/presentations/screens/user_settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            tooltip: 'Profile',
            icon: const Icon(Icons.person_outline),
            onPressed: () => Get.to(() => const UserProfileScreen()),
          ),
          IconButton(
            tooltip: 'Settings',
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Get.to(() => const UserSettingsScreen()),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "WildHelp",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F4F3E),
                ),
              ),

              const SizedBox(height: 40),

              HomeCardButton(
                label: "Found an injured \nwild animal?",
                iconData: Icons.healing,
                onTap: () {
                  Get.to(InjuredAnimalReportScreen());
                },
              ),
              const SizedBox(height: 10),
              HomeCardButton(
                label: "Wildlife clinics \nnear you",
                iconData: Icons.location_on,
                onTap: () {
                  Get.to(WildlifeClinicsScreen());
                },
              ),
              const SizedBox(height: 10),
              HomeCardButton(
                label: "First aid tips",
                iconData: Icons.add,
                onTap: () {
                  Get.to(FirstAidTipsScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
