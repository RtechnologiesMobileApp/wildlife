import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/config/constants/images.dart';
import 'package:wildlife/features/auth/presentations/screens/signin_screen.dart';
import 'package:wildlife/features/auth/presentations/screens/wild_center_login_screen.dart';
import 'package:wildlife/features/onBoarding/presentations/widgets/rounded_button.dart';

class LoginChoiceScreen extends StatefulWidget {
  const LoginChoiceScreen({super.key});

  @override
  State<LoginChoiceScreen> createState() => _LoginChoiceScreenState();
}

class _LoginChoiceScreenState extends State<LoginChoiceScreen>
    with SingleTickerProviderStateMixin {
  bool _showUserOptions = false;

  void _toggleUserOptions() {
    setState(() => _showUserOptions = !_showUserOptions);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white, // White background
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Logo & App Name
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logo, width: screenWidth * 0.4),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome to WildLife',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      'Connect with wildlife centers and help animals in need safely and quickly.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),

            // Buttons Section
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                      text: "I'm a User",
                      // backgroundColor: AppColors.primaryGreen,
                      // textColor: Colors.white,
                      onPressed: () => Get.to(const SigninScreen()),
                    ),
                    const SizedBox(height: 16),
                    RoundedButton(
                      text: "I'm a Wildlife Center",
                      // backgroundColor: AppColors.secondaryGreen,
                      // textColor: Colors.white,
                      onPressed: () => Get.to(const CenterLoginScreen()),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Select your role to continue',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
