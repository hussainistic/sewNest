import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth_services/my_auth_services.dart';
import '../../presentation/rider_views/dashboard_screens/dashboard_screen.dart';

class RiderLoginController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey();

  final isLoading = false.obs;

  final RxBool _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;
  void togglePasswordVisibility() {
    _obscurePassword.value = !_obscurePassword.value;
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
  }

  void loginRider({
    required String email,
    required String password
  }) async {
    isLoading.value = true;
    clearController();
    User? user = await AppAuthService.riderLoginToApp(email, password);
    if(user != null){
      isLoading.value = false;
      Get.snackbar(
        "Success", "You have been logged in successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white24,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
        boxShadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      );
      // Navigate to the Rider Dashboard or another screen
       Get.to(() => RiderDashboardScreen());
    }
    else {
      isLoading.value = false;
      Get.snackbar(
        "Login Failed", "Unable to log in",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
        boxShadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      );
    }
  }
}
