import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/config/constants/colors.dart';
import 'package:wildlife/features/auth/controller/auth_controller.dart';
import 'package:wildlife/features/wildlifecenterdashboard/presentations/screens/center_signup_screen.dart';

class CenterLoginScreen extends StatefulWidget {
  const CenterLoginScreen({super.key});

  @override
  State<CenterLoginScreen> createState() => _CenterLoginScreenState();
}

class _CenterLoginScreenState extends State<CenterLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CenterAuthController());
    final primary = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(title: const Text('Wildlife Center Login')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: constraints.maxWidth < 560 ? double.infinity : 560,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 92,
                                height: 92,
                                decoration: BoxDecoration(
                                  color: primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.business, size: 44, color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Center Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 18),
                            TextField(
                              decoration: const InputDecoration(labelText: 'Email'),
                              onChanged: (v) => controller.email.value = v,
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              decoration: const InputDecoration(labelText: 'Password'),
                              obscureText: true,
                              onChanged: (v) => controller.password.value = v,
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Verification Code',
                              ),
                              onChanged: (v) => controller.passcode.value = v,
                            ),
                            const SizedBox(height: 18),
                            Obx(() {
                              return SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: controller.isLoading.value ? null : () => controller.login(),
                                  child: controller.isLoading.value
                                      ? const CircularProgressIndicator(color: Colors.white)
                                      : const Text('Sign In', style: TextStyle(color: Colors.white)),
                                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary,
                                      )
                                ),
                              );
                            }),
                            const SizedBox(height: 12),
                            TextButton(
                              onPressed: () => Get.to(const CenterSignupScreen()),
                              child: const Text('New center? Register here', style: TextStyle(color: AppColors.primary)),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue.withValues(alpha: 0.05),
                                border: const Border(left: BorderSide(color: Colors.blue, width: 3)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'A valid verification code is required for wildlife center access. Contact your administrator if you need assistance.',
                                style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
