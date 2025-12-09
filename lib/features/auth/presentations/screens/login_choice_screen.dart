import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/features/auth/presentations/screens/signup_screen.dart';
import 'package:wildlife/features/auth/presentations/screens/wild_center_login_screen.dart';
import 'package:wildlife/features/auth/presentations/screens/signin_screen.dart';
import 'package:wildlife/features/home/presentations/screens/home_screen.dart';
import 'package:wildlife/features/onBoarding/presentations/widgets/rounded_button.dart';

class LoginChoiceScreen extends StatefulWidget {
  const LoginChoiceScreen({super.key});

  @override
  State<LoginChoiceScreen> createState() => _LoginChoiceScreenState();
}

class _LoginChoiceScreenState extends State<LoginChoiceScreen> with SingleTickerProviderStateMixin {
  bool _showUserOptions = false;

  void _toggleUserOptions() {
    setState(() => _showUserOptions = !_showUserOptions);
  }

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
              const SizedBox(height: 32),

              // Original "I'm a User" button remains. Tapping it reveals Sign in / Create account.
              RoundedButton(
                text: "I'm a User",
                onPressed: _toggleUserOptions,
              ),

           _showUserOptions ?   const SizedBox(height: 12) : const SizedBox.shrink(),

              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Column(
                  children: [
                    RoundedButton(
                      text: "Sign in",
                      onPressed: () => Get.to(const SigninScreen()),
                    ),
                    const SizedBox(height: 10),
                    RoundedButton(
                      text: "Create account",
                      onPressed: () => Get.to(SignupScreen()),
                    ),
                  ],
                ),
                crossFadeState: _showUserOptions ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 250),
              ),

              const SizedBox(height: 18),

              RoundedButton(
                text: "I'm a Wildlife Center",
                onPressed: () => Get.to(CenterLoginScreen()),
              ),
              const SizedBox(height: 12),

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
