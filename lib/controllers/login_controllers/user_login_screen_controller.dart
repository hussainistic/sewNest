import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/models/user_model.dart';
import 'package:sewnest/presentation/user_views/dashboard_screens/user_dashboard_screen.dart';
import '../../auth_services/my_auth_services.dart';

class UserLoginController extends GetxController {
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

  void loginUser({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    clearController();

    User? firebaseUser = await AppAuthService.userLoginToApp(email, password);

    if (firebaseUser != null) {
      try {
        // Fetch user data from Firestore
        var userDoc = await AppAuthService.firestore
            .collection('users')
            .doc(firebaseUser.uid)
            .get();

        if (userDoc.exists) {
          // Map Firestore data to UserModel
          UserModel userModel = UserModel.fromDocumentSnapshot(userDoc);

          isLoading.value = false;

          Get.snackbar(
            "Success",
            "You have been logged in successfully",
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

          // Navigate to UserDashboardScreen
          Get.to(() => UserDashboardScreen(user: userModel));
        } else {
          throw Exception("User data not found in Firestore.");
        }
      } catch (e) {
        isLoading.value = false;
        Get.snackbar(
          "Login Failed",
          "Unable to fetch user data. Please try again.",
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
    } else
    {
      isLoading.value = false;
      Get.snackbar(
        "Login Failed",
        "Unable to log in",
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
