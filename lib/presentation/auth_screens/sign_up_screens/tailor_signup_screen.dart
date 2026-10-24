import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/signup_controllers/tailor_signup_controller.dart';
import '../../../custom_widgets/CustomHeaderSection.dart';
import '../../../custom_widgets/header_design.dart';
import '../../../utilis/styles/CustomAppTextStyle.dart';
import '../../../utilis/styles/customColors.dart';
import '../login_screens/tailor_login_screen.dart';

class TailorSignupScreen extends StatelessWidget {
  final TailorSignupController tailorSignupController = Get.put(TailorSignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             HeaderDesign(
               title: 'Tailor SignUp', icon: Icons.cut, onIconPressed: null, backIconPressed:() => Get.to(() => TailorLoginScreen()) ,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeaderSection(
                    headingTitle: 'Tailor Registration',
                    subHeadingTitle: 'Create your tailor account',
                    headingColor: const Color(0xED44284E),
                    subHeadingColor: Colors.grey.shade700,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Form(
                key: tailorSignupController.tailorFormkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Name
                    TextFormField(
                      controller: tailorSignupController.tailorNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a tailor name';
                        } else if (!RegExp(r"^[a-zA-Z0-9_\s]{3,20}$").hasMatch(value)) {
                          return 'Tailor Name must be 3-20 characters and contain only\n letters, numbers, underscores, and spaces';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Tailor Name',
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
                    //Phone number
                    TextFormField(
                      controller: tailorSignupController.phoneNoController,
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
                    //email
                    TextFormField(
                      controller: tailorSignupController.emailController,
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
                    //experience
                    TextFormField(
                      controller: tailorSignupController.experienceController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your experience level';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Experience',
                        labelStyle: labelTextStyle,
                        hintText: 'Enter your experience level',
                        prefixIcon: const Icon(Icons.work, color: CustomColors.secondaryColor),
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
                    // Specialization Dropdown
                    Obx(() {
                      return DropdownButtonFormField<String>(
                        value: tailorSignupController.selectedSpecialization.value.isEmpty
                            ? null
                            : tailorSignupController.selectedSpecialization.value,
                        onChanged: (value) {
                          tailorSignupController.selectedSpecialization.value = value ?? "";
                        },
                        items: const [
                          DropdownMenuItem(value: "Kids", child: Text("Kids")),
                          DropdownMenuItem(value: "Women", child: Text("Women")),
                          DropdownMenuItem(value: "Men", child: Text("Men")),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Specialization',
                          labelStyle: labelTextStyle,
                          prefixIcon: const Icon(Icons.category, color: CustomColors.secondaryColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: CustomColors.primaryColor.withOpacity(0.5),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a specialization';
                          }
                          return null;
                        },
                      );
                    }),
                    const SizedBox(height: 10),
                    //password
                    Obx(() => TextFormField(
                      controller: tailorSignupController.passwordController,
                      obscureText: tailorSignupController.obscurePassword,
                      validator: tailorSignupController.validatePassword,
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
                            tailorSignupController.obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: CustomColors.secondaryColor,
                          ),
                          onPressed: () {
                            tailorSignupController.togglePasswordVisibility();
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
                    Obx(() =>  CheckingPasswordStatus(isCheck: tailorSignupController.isEightCharacter.value, title: "Contains 8 characters")),
                    const SizedBox(height: 5,),
                    Obx(() =>  CheckingPasswordStatus(isCheck: tailorSignupController.hasNumber.value, title: "Contains one digit(0-9)")),
                    const SizedBox(height: 5,),
                    Obx(() =>  CheckingPasswordStatus(isCheck: tailorSignupController.hasSymbol.value, title: "Contains special characters(!@#%^&*)")),
                    const SizedBox(height: 5,),
                    Obx(() =>  CheckingPasswordStatus(isCheck: tailorSignupController.hasUpperCase.value, title: "Has upper case(A-Z)")),
                    const SizedBox(height: 5,),
                    Obx(() =>  CheckingPasswordStatus(isCheck: tailorSignupController.hasLowerCase.value, title: "Has lower case(a-z)")),

                    const SizedBox(height: 20,),
                    // SignUp Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (tailorSignupController.tailorFormkey.currentState!.validate()) {
                                tailorSignupController.signUp(
                                  tailorName: tailorSignupController.tailorNameController.text,
                                  phoneNo: tailorSignupController.phoneNoController.text,
                                  email: tailorSignupController.emailController.text,
                                  experience: int.parse(tailorSignupController.experienceController.text),
                                  password: tailorSignupController.passwordController.text,
                                  specialization: tailorSignupController.selectedSpecialization.value
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
                        const SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            Get.to(TailorLoginScreen());
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(() => Visibility(
              visible: tailorSignupController.isLoading.value,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(CustomColors.secondaryColor),
                  ),
                ),
              ),
            )),
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
