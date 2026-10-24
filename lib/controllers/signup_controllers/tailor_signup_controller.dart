import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/presentation/auth_screens/login_screens/tailor_login_screen.dart';
import '../../app_database/firestoreDB.dart';
import '../../auth_services/my_auth_services.dart';

class TailorSignupController extends GetxController {
  final GlobalKey<FormState> tailorFormkey = GlobalKey();

  // Controllers for input fields
  TextEditingController tailorNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  // Reactive value for specialization dropdown
  RxString selectedSpecialization = ''.obs;

  Rx<bool> isLoading = false.obs;

  final Rx<bool> _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;

  final RegExp numericRegex = RegExp(r"[0-9]");
  final RegExp symbolRegex = RegExp(r"[!@#$%^&*()]");
  final RegExp upperCaseRegex = RegExp(r"[A-Z]");
  final RegExp lowerCaseRegex = RegExp(r"[a-z]");

  final Rx<bool> isEightCharacter = false.obs;
  final Rx<bool> hasNumber = false.obs;
  final Rx<bool> hasSymbol = false.obs;
  final Rx<bool> hasUpperCase = false.obs;
  final Rx<bool> hasLowerCase = false.obs;


  //run before the build
  @override
  void onInit() {
    super.onInit();
    passwordController.addListener(passwordValidator);
  }

  void passwordValidator() {
    final password = passwordController.text;
    isEightCharacter.value = password.length >= 8;
    hasNumber.value = numericRegex.hasMatch(password);
    hasSymbol.value = symbolRegex.hasMatch(password);
    hasUpperCase.value = upperCaseRegex.hasMatch(password);
    hasLowerCase.value = lowerCaseRegex.hasMatch(password);
  }
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    passwordValidator();
    if (!isEightCharacter.value || !hasNumber.value || !hasSymbol.value || !hasUpperCase.value || !hasLowerCase.value) {
      return "Password doesn't meet the criteria";
    }
    return null;
  }

  void togglePasswordVisibility() {
    _obscurePassword.value = !_obscurePassword.value;
  }

  void clearController() {
    tailorNameController.clear();
    phoneNoController.clear();
    emailController.clear();
    passwordController.clear();
    experienceController.clear();
    selectedSpecialization.value = '';
  }

  void signUp({
    required String tailorName,
    required String phoneNo,
    required String email,
    required String password,
    required String specialization,
    required int experience,
  }) async {
    isLoading.value = true;

    try {
      // Attempt to sign up using Firebase Auth
      User? user = await AppAuthService.signupToApp(email, password, 'tailor');

      if (user != null) {
        // Save tailor data to Firestore
        await MyFirestore_db.saveTailorData(
          tailorID: MyFirestore_db.currentUserID,
          tailorName: tailorName,
          phoneNo: phoneNo,
          email: email,
          specialization: specialization,
          experience: experience,
        );

        // Clear controllers and navigate to login
        clearController();

        Get.snackbar(
          "Success", "Tailor account created successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          snackStyle: SnackStyle.FLOATING,
          boxShadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 6,
            ),
          ],);
        Get.offAll(() => TailorLoginScreen());
      } else {
        throw Exception("Unable to create tailor account");
      }
    } catch (e) {
      Get.snackbar(
        "Signup Failed", e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
