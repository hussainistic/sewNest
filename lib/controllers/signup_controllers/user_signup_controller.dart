import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/presentation/auth_screens/login_screens/user_login_screen.dart';
import '../../app_database/firestoreDB.dart';
import '../../auth_services/my_auth_services.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> userFormkey = GlobalKey();

  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<bool> isLoading = false.obs;

  final Rx<bool> _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;
  void togglePasswordVisibility() {
    _obscurePassword.value = !_obscurePassword.value;
  }

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

  void clearController() {
    userNameController.clear();
    phoneNoController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void signUp({
    required String userName,
    required String phoneNo,
    required String email,
    required String password
}) async {
    isLoading.value = true;
    clearController();
    User? user = await AppAuthService.signupToApp(email, password , 'user');
    if(user!= null) {
      isLoading.value = false;
      Get.snackbar(
        "Success", "You have been signed up successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
        snackStyle: SnackStyle.FLOATING,
        boxShadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 4),
            blurRadius: 6,
          ),
        ],);

      //add user to firestore
      MyFirestore_db.saveUserData(
          userID: MyFirestore_db.currentUserID,
          userName: userName,
          phoneNo: phoneNo,
          email: email);
      Get.offAll(()=> UserLoginScreen());
    }
    else {
      isLoading.value = false;
      Get.snackbar(
        "Signup Failed", "Unable to SignUp",
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
     }
    }

  @override
  void onClose() {
    passwordController.removeListener(passwordValidator);
    super.onClose();
  }
}
