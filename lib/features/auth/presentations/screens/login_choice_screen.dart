import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/features/auth/presentations/screens/wild_center_login_screen.dart';
import 'package:wildlife/features/home/presentations/screens/home_screen.dart';
import 'package:wildlife/features/onBoarding/presentations/widgets/rounded_button.dart';

class LoginChoiceScreen extends StatelessWidget {
  const LoginChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Who are you?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),

              RoundedButton(
                text: "I'm a User",
                onPressed: () => Get.snackbar('Info', 'User flow coming soon!'),
              ),

              const SizedBox(height: 20),

              RoundedButton(
                text: "I'm a Wildlife Center",
                onPressed: () => Get.to(CenterLoginScreen()),
              ),
              const SizedBox(height: 20),

              RoundedButton(
                text: "I'm a Wildlife helpcenter",
                onPressed: () => Get.to(HomeScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
