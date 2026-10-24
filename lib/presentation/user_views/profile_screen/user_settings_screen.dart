import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sewnest/presentation/tailer_views/profile_screen/widgets/alert_dialogues/logout_alert_dialogue.dart';
import 'package:sewnest/presentation/tailer_views/profile_screen/widgets/alert_dialogues/rateus_alert_dialogue.dart';
import 'package:sewnest/presentation/tailer_views/profile_screen/widgets/feedback_screen.dart';
import 'package:sewnest/presentation/tailer_views/profile_screen/widgets/help_and_support_screen.dart';
import 'package:sewnest/presentation/tailer_views/profile_screen/widgets/terms_of_services.dart';
import 'package:sewnest/presentation/user_views/profile_screen/widgets/myuser_profile_screen.dart';
import 'package:sewnest/presentation/user_views/profile_screen/widgets/user_feedback_screen.dart';
import 'package:sewnest/utilis/app_images.dart';
import '../../../utilis/dimensions.dart';
import '../../../utilis/styles/customColors.dart';

class UserSettingsScreen extends StatelessWidget {
  UserSettingsScreen({super.key});
  final userId = FirebaseAuth.instance.currentUser!.uid;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: Get.width / 2 * 1.06,
                decoration: const BoxDecoration(
                  color: CustomColors.primaryColor,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(65)),
                ),
              ),
              Container(
                height: Get.width / 2,
                decoration: const BoxDecoration(
                  color: CustomColors.secondaryColor,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(65)),
                ),
              ),
              Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      // image
                    },
                    child: CircleAvatar(
                      radius: 60,
                        backgroundColor: CustomColors.primaryColor.withOpacity(0.9),
                      child: const Icon(Icons.person_2_sharp, size: 60, color: Colors.white),
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 80),

          InkWell(
            onTap: () {
              Get.to( MyUserProfileScreen(userId: userId));
            },
            child: const SettingsFieldsOptions(icon: AppImages.profile, title: 'My Profile'),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Get.to(const HelpAndSupportScreen());
            },
            child: const SettingsFieldsOptions(icon: AppImages.phone, title: 'Help & Support'),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Get.to(const TermsOfServiceScreen());
            },
            child: const SettingsFieldsOptions(icon: AppImages.terms_of_services, title: 'Terms Of Services'),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Get.to(const userFeedbackScreen());
            },
            child: const SettingsFieldsOptions(icon: AppImages.feedback, title: 'Feedback'),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Get.dialog(
                const RateUsAlertDialog(),
                barrierDismissible: true,
              );
            },
            child: const SettingsFieldsOptions(icon: AppImages.heart, title: 'Rate Us'),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Get.dialog(
                const LogoutAlertDialog(),
                barrierDismissible: true,
              );
            },
            child: const SettingsFieldsOptions(icon: AppImages.logout, title: 'Logout'),
          ),
        ],
      ),
    );
  }
}

class SettingsFieldsOptions extends StatelessWidget {
  const SettingsFieldsOptions({
    super.key, required this.icon, required this.title,
  });
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraLarge),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).hintColor.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            Dimensions.paddingSizeLarge,
            Dimensions.paddingSizeExtraSmall,
            Dimensions.paddingSizeExtraSmall,
            Dimensions.paddingSizeExtraSmall),
        child: Row(
          children: [
            SizedBox(
              width: Dimensions.iconSizeDefault,
              child: Image.asset(icon, color: CustomColors.secondaryColor),
            ),
            const SizedBox(width: Dimensions.paddingSizeDefault),
            Expanded(child: Text(title)),
            const Icon(Icons.arrow_forward_ios, size: 20, color: CustomColors.secondaryColor),
          ],
        ),
      ),
    );
  }
}