import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/signup_controllers/rider_signup_controller.dart';
import '../../../custom_widgets/CustomHeaderSection.dart';
import '../../../custom_widgets/header_design.dart';
import '../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../utilis/styles/customColors.dart';
import '../login_screens/rider_login_screen.dart';

class RiderSignupScreen extends StatelessWidget {
  final RiderSignupController riderSignupController = Get.put(RiderSignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             HeaderDesign(title: 'Rider SignUp', icon: Icons.motorcycle, onIconPressed:null , backIconPressed:  () =>  Get.to(() => RiderLoginScreen())),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeaderSection(
                    headingTitle: 'Rider Registration',
                    subHeadingTitle: 'Create your rider account',
                    headingColor: const Color(0xED44284E),
                    subHeadingColor: Colors.grey.shade700,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Form(
                key: riderSignupController.riderFormkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: riderSignupController.riderNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a rider name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Rider Name',
                        labelStyle: labelTextStyle,
                        hintText: 'Enter your name',
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
                      controller: riderSignupController.phoneNoController,
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
                      controller: riderSignupController.emailController,
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
                    TextFormField(
                      controller: riderSignupController.vehicleTypeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your vehicle type';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Vehicle Type',
                        labelStyle: labelTextStyle,
                        hintText: 'Enter your vehicle type',
                        prefixIcon: const Icon(Icons.motorcycle, color: CustomColors.secondaryColor),
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
                      controller: riderSignupController.licenseNoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your license number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'License No',
                        labelStyle: labelTextStyle,
                        hintText: 'Enter your license number',
                        prefixIcon: const Icon(Icons.credit_card, color: CustomColors.secondaryColor),
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
                      controller: riderSignupController.passwordController,
                      obscureText: riderSignupController.obscurePassword,
                      validator: riderSignupController.validatePassword,
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
                            riderSignupController.obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: CustomColors.secondaryColor,
                          ),
                          onPressed: () {
                            riderSignupController.togglePasswordVisibility();
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
                    Obx(() =>  CheckingPasswordStatus(isCheck: riderSignupController.isEightCharacter.value, title: "Contains 8 characters")),
                    const SizedBox(height: 5,),
                    Obx(() =>  CheckingPasswordStatus(isCheck: riderSignupController.hasNumber.value, title: "Contains one digit(0-9)")),
                    const SizedBox(height: 5,),
                    Obx(() =>  CheckingPasswordStatus(isCheck: riderSignupController.hasSymbol.value, title: "Contains special characters(!@#%^&*)")),
                    const SizedBox(height: 5,),
                    Obx(() =>  CheckingPasswordStatus(isCheck: riderSignupController.hasUpperCase.value, title: "Has upper case(A-Z)")),
                    const SizedBox(height: 5,),
                    Obx(() =>  CheckingPasswordStatus(isCheck: riderSignupController.hasLowerCase.value, title: "Has lower case(a-z)")),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (riderSignupController.riderFormkey.currentState!.validate()) {
                                riderSignupController.signUp(
                                    riderName: riderSignupController.riderNameController.text,
                                    phoneNo: riderSignupController.phoneNoController.text,
                                    email: riderSignupController.emailController.text,
                                    vehicleType: riderSignupController.vehicleTypeController.text,
                                    licenseNo: riderSignupController.licenseNoController.text,
                                    password: riderSignupController.passwordController.text,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const SizedBox(width: 50,),
                          TextButton(
                            onPressed: () {
                              Get.to(RiderLoginScreen());
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
                    ),
                  ],
                ),
              ),
            ),
            Obx(() => Visibility(
                visible: riderSignupController.isLoading.value,
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
