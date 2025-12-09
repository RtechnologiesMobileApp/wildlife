import 'package:get/get.dart';
import 'package:wildlife/features/auth/services/auth_services.dart';
import 'package:wildlife/features/wildlifecenterdashboard/presentations/screens/dashboard_screen.dart';

class CenterAuthController extends GetxController {
  final authService = AuthService();

  var email = ''.obs;
  var password = ''.obs;
  var passcode = ''.obs;

  var isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    final success = await authService.loginCenter(
      email.value,
      password.value,
      passcode.value,
    );

    isLoading.value = false;

    if (success) {
      Get.offAll(CenterDashboardScreen());
    } else {
      Get.snackbar('Login Failed', 'Invalid credentials or passcode');
    }
  }
}
