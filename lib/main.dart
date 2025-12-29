import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wildlife/features/onBoarding/presentations/screens/splash_screen.dart';

void main() {
  runApp(WildHelpApp());
}

class WildHelpApp extends StatelessWidget {
  const WildHelpApp({super.key});

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

    // ✅ Wrap GetMaterialApp with ScreenUtilInit
    return ScreenUtilInit(
      designSize: const Size(375, 812), // your Figma design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'WildLife',
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const SplashScreen(),
        );
      },
    );
  }
}
