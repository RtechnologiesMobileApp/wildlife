import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/features/auth/presentations/screens/login_choice_screen.dart';
import 'package:wildlife/features/onBoarding/presentations/widgets/check_box.dart';
import 'package:wildlife/features/onBoarding/presentations/widgets/rounded_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingConsentScreenState();
}

class _OnboardingConsentScreenState extends State<OnboardingScreen> {
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: const Text(
                  "Before You Continue",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F4F3E),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: const Text(
                  "By continuing, you agree that your wildlife report and "
                  "location may be shared with licensed wildlife rehabilitation "
                  "organizations to help them respond.",
                  style: TextStyle(fontSize: 16, height: 1.4),
                ),
              ),
              const SizedBox(height: 10),

              CheckboxTile(
                value: agreed,
                label: "I agree",
                onChanged: (value) {
                  setState(() => agreed = value ?? false);
                },
              ),

              const SizedBox(height: 33),

              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Rounded corners
                child: Image.asset(
                  "assets/images/onBoard.PNG",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.contain, // Full width crop style
                ),
              ),
              const Spacer(),

              RoundedButton(
                text: "Continue",
                enabled: agreed,
                onPressed: () {
                  Get.to(LoginChoiceScreen());
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()),
                  // );

                  // Navigate forward
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
