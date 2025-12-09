import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wildlife/features/onBoarding/presentations/screens/on_boarding_screen.dart';

void main() {
  runApp(WildHelpApp());
}

class WildHelpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF2F6B4A), // forest green
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Roboto',

      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
          color: Color(0xFF123524),
        ),
        bodySmall: TextStyle(fontSize: 16.0, color: Color(0xFF22332A)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        ),
      ),
    );

    return GetMaterialApp(
      title: 'WildLife',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const OnboardingScreen(),
    );
  }
}
