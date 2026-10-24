import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/signup_controllers/user_signup_controller.dart';
import '../../../custom_widgets/CustomHeaderSection.dart';
import '../../../custom_widgets/header_design.dart';
import '../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../utilis/styles/customColors.dart';
import '../login_screens/user_login_screen.dart';

class SignupScreen extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             HeaderDesign(title: 'SignUp', icon: Icons.app_registration, onIconPressed: null , backIconPressed: () => Get.to(() => UserLoginScreen())),
            // Header Text section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeaderSection(
                    headingTitle: 'Register',
                    subHeadingTitle: 'Create your new account',
                    headingColor: const Color(0xED44284E),
                    subHeadingColor: Colors.grey.shade700,
                  ),
                ],
              ),
            ),

            // TextForm Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Form(
                key: signupController.userFormkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: signupController.userNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        } else if (!RegExp(r"^[a-zA-Z0-9_\s]{3,20}$").hasMatch(value)) {
                          return 'Username must be 3-20 characters and contain only\n letters, numbers, underscores, and spaces';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'UserName',
                        labelStyle: labelTextStyle,
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(
                          color: CustomColors.secondaryColor.withOpacity(0.7),
                        ),
                        prefixIcon: const Icon(Icons.person, color: CustomColors.secondaryColor),
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
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: signupController.phoneNoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (value.length != 11) {
                          return 'Phone number must be 11 digits';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'PhoneNo',
                        labelStyle: labelTextStyle,
                        hintText: 'Enter your phone no',
                        hintStyle: TextStyle(
                          color: CustomColors.secondaryColor.withOpacity(0.7),
                        ),
                        prefixIcon: const Icon(Icons.phone_android_sharp, color: CustomColors.secondaryColor),
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
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: signupController.emailController,
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
                    const SizedBox(height: 10),
                    Obx(() => TextFormField(
                      controller: signupController.passwordController,
                      obscureText: signupController.obscurePassword,
                      validator: signupController.validatePassword,
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
                            signupController.obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: CustomColors.secondaryColor,
                          ),
                          onPressed: () {
                            signupController.togglePasswordVisibility();
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
                    ),
                    ),

                    const SizedBox(height: 20),
                    Obx(() =>  CheckingPasswordStatus(isCheck: signupController.isEightCharacter.value, title: "Contains 8 characters")),
                    const SizedBox(height: 5,),
                    Obx(() =>  CheckingPasswordStatus(isCheck: signupController.hasNumber.value, title: "Contains one digit(0-9)")),
                    const SizedBox(height: 5,),
                    Obx(() =>  CheckingPasswordStatus(isCheck: signupController.hasSymbol.value, title: "Contains special characters(!@#%^&*)")),
                    const SizedBox(height: 5,),
                    Obx(() =>  CheckingPasswordStatus(isCheck: signupController.hasUpperCase.value, title: "Has upper case(A-Z)")),
                    const SizedBox(height: 5,),
                    Obx(() =>  CheckingPasswordStatus(isCheck: signupController.hasLowerCase.value, title: "Has lower case(a-z)")),

                    const SizedBox(height: 70),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (signupController.userFormkey.currentState!.validate()) {
                                signupController.signUp(
                                    userName: signupController.userNameController.text,
                                    phoneNo: signupController.phoneNoController.text,
                                    email: signupController.emailController.text,
                                    password: signupController.passwordController.text
                                );
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
                            child: const Text('SignUp'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const SizedBox(width: 50,),
                        TextButton(
                          onPressed: () {
                            Get.to(UserLoginScreen());
                          },
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(color: CustomColors.primaryColor),
                                ),
                                TextSpan(
                                  text: 'Sign in',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: CustomColors.secondaryColor),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(() => Visibility(
                visible: signupController.isLoading.value,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(CustomColors.secondaryColor),
                    ),
                  ),
                )),
            )
          ],
        ),
      ),
    );
  }
}

class CheckingPasswordStatus extends StatelessWidget {
  const CheckingPasswordStatus({
    super.key,
    required this.isCheck,
    required this.title,
  });

  final bool isCheck;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 15,),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: isCheck? CustomColors.secondaryColor:Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: isCheck? Colors.transparent:CustomColors.secondaryColor,
              )
          ),
          child: Icon(Icons.check, size: 15,
            color: isCheck? Colors.white:Colors.black,),
        ),
        const SizedBox(width: 10,),
        Text(title,style: labelTextStyle,),
      ],
    );
  }
}

