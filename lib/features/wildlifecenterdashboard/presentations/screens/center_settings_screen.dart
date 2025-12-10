import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/auth/presentations/screens/login_choice_screen.dart';

class CenterSettingsScreen extends StatefulWidget {
  const CenterSettingsScreen({super.key});

  @override
  State<CenterSettingsScreen> createState() => _CenterSettingsScreenState();
}

class _CenterSettingsScreenState extends State<CenterSettingsScreen> {
  bool _notifications = true;
  bool _darkMode = false;

  void _logout() {
    // For prototype, navigate back to login choice
    Get.offAll(() => const LoginChoiceScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SwitchListTile(
              title: const Text('Notifications'),
              subtitle: const Text('Receive new report alerts'),
              value: _notifications,
              onChanged: (v) => setState(() => _notifications = v),
              thumbColor: MaterialStateProperty.all(Colors.white),
             
              activeTrackColor: AppColors.primary,
            ),
            SwitchListTile(
              title: const Text('Dark Mode'),
              subtitle: const Text('Use darker colors in the app'),
              value: _darkMode,
              onChanged: (v) => setState(() => _darkMode = v),
              thumbColor: MaterialStateProperty.all(Colors.white),
              activeTrackColor: AppColors.primary,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _logout,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Logout', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 8),
            TextButton(onPressed: () => Get.back(), child: const Text('Close', style: TextStyle(color: AppColors.primary))),
          ],
        ),
      ),
    );
  }
}
