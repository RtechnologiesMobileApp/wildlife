import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wildlife/config/constants/images.dart';
import 'package:wildlife/features/onBoarding/presentations/screens/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to next screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change to your brand color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo, // Add your app logo in assets
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),
            // const CircularProgressIndicator(
            //   color: Colors.green, // Match your theme
            // ),
          ],
        ),
      ),
    );
  }
}
