import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/presentation/auth_screens/sign_up_screens/rider_signup_screen.dart';
import 'package:sewnest/presentation/role_selection.dart';
import '../../../controllers/login_controllers/rider_login_controller.dart';
import '../../../custom_widgets/CustomHeaderSection.dart';
import '../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../utilis/styles/clipPath.dart';
import '../../../utilis/styles/customColors.dart';

class RiderLoginScreen extends StatelessWidget {
  final RiderLoginController loginController = Get.put(RiderLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  ClipPath(
                    clipper: BottomCurveClipper(),
                    child: Container(
                      color: CustomColors.secondaryColor,
                      height: 250,
                    ),
                  ),
                  ClipPath(
                    clipper: BottomCurveClipper(),
                    child: Container(
                        height: 240,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/rider_login.jpg'),
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                  ),
                  Positioned(
                    top: 32,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                      onPressed: () {
                        Get.to(() => RoleSelectionScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Header Text Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  HeaderSection(
                    headingTitle: 'Welcome Back, Rider!',
                    subHeadingTitle: 'Login to your rider account',
                    headingColor: const Color(0xED44284E),
                    subHeadingColor: Colors.grey.shade700,
                  ),
                ],
              ),
            ),

            // Form Fields Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Form(
                key: loginController.formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: loginController.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: labelTextStyle,
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          color: CustomColors.secondaryColor.withOpacity(0.7),
                        ),
                        prefixIcon: const Icon(Icons.email, color: CustomColors.secondaryColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Color(0xED44284E),
                            )
                        ),
                        filled: true,
                        fillColor: CustomColors.primaryColor.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(() => TextFormField(
                      controller: loginController.passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                      obscureText: loginController.obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: labelTextStyle,
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                          color: CustomColors.secondaryColor.withOpacity(0.7),
                        ),
                        prefixIcon: const Icon(Icons.lock, color: CustomColors.secondaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            loginController.obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: CustomColors.secondaryColor,
                          ),
                          onPressed: () {
                            loginController.togglePasswordVisibility();
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Color(0xED44284E),
                            )
                        ),
                        filled: true,
                        fillColor: CustomColors.primaryColor.withOpacity(0.5),
                      ),
                    )),
                    const SizedBox(height: 140),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if(loginController.formkey.currentState!.validate()) {
                              loginController.loginRider(
                                  email: loginController.emailController.text,
                                  password: loginController.passwordController.text);
                            } else {
                              Get.snackbar(
                                "Error", "Please fill all fields correctly.",
                                snackPosition: SnackPosition.TOP,
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
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.secondaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 50,),
                          TextButton(
                            onPressed: () {
                              Get.to(() => RiderSignupScreen());
                            },
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: TextStyle(color: CustomColors.primaryColor),
                                  ),
                                  TextSpan(
                                    text: 'Sign up',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: CustomColors.secondaryColor),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() => Visibility(
                visible: loginController.isLoading.value,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(CustomColors.secondaryColor),
                    ),
                  ),
                ))),
          ],
        ),
      ),
    );
  }
}
