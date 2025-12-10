import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/auth/presentations/screens/login_choice_screen.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({super.key});

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  bool _notifications = true;
  bool _darkMode = false;
  bool _locationSharing = true;

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
              subtitle: const Text('Receive report status updates'),
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
            SwitchListTile(
              title: const Text('Location Sharing'),
              subtitle: const Text('Share location for wildlife reports'),
              value: _locationSharing,
              onChanged: (v) => setState(() => _locationSharing = v),
              thumbColor: MaterialStateProperty.all(Colors.white),
              activeTrackColor: AppColors.primary,
            ),
            const SizedBox(height: 16),
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
