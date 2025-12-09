import 'package:flutter/material.dart';
import 'package:wildlife/config/constants/images.dart';

class FirstAidTipsScreen extends StatelessWidget {
  const FirstAidTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Aid Tips"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder illustration
              Image.asset(AppImages.wildleaf, height: 180),
              const SizedBox(height: 32),
              const Text(
                "First aid tips coming soon — do not handle dangerous wildlife or put yourself at risk.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
