import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/features/home/presentations/screens/home_screen.dart';
import 'package:wildlife/features/onBoarding/presentations/widgets/rounded_button.dart';

class ReportSuccessScreen extends StatelessWidget {
  const ReportSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green[700],
                size: 120,
              ),
              const SizedBox(height: 24),
              const Text(
                'Report Submitted Successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Thank you for helping wildlife. Your report has been received and will be processed by our team.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 32),

              RoundedButton(
                text: "Go to Home",

                onPressed: () {
                  Get.to(HomeScreen());
                },
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       // Navigate back to home or main screen
              //       Navigator.pushAndRemoveUntil(
              //         context,
              //         MaterialPageRoute(builder: (context) => const HomeScreen()),
              //         (route) => false,
              //       );
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.green[700],
              //       padding: const EdgeInsets.symmetric(vertical: 16),
              //     ),
              //     child: const Text(
              //       'Go to Home',
              //       style: TextStyle(fontSize: 16),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
