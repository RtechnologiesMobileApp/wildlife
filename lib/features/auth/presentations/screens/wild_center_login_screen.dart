import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildlife/features/auth/controller/auth_controller.dart';
import 'package:wildlife/features/onBoarding/presentations/widgets/rounded_button.dart';

class CenterLoginScreen extends StatelessWidget {
  const CenterLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CenterAuthController());

    return Scaffold(
      appBar: AppBar(title: const Text('Wildlife Center Login')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (v) => controller.email.value = v,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (v) => controller.password.value = v,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Verification Passcode',
              ),
              onChanged: (v) => controller.passcode.value = v,
            ),

            const SizedBox(height: 20),

            Obx(() {
              return controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : RoundedButton(
                      text: 'Sign In',
                      onPressed: () => controller.login(),
                    );
            }),

            const SizedBox(height: 16),
            const Text(
              'A valid authentication passcode is required for wildlife center access.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
